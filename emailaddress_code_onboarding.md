# Navigating cfssl code

*these are draft notes used while implementing the emailAddress functionality*

From pkiadmin we use the command `cfssl genkey`, in `EmbeddedPKIEngine.createCSR`.

We send as parameter a JSON file with contents:

```
    let csr = {
      CN: csrParameters.subject.CN,
      hosts: hosts,
      key: {
        size: keyBits,
        algo: algorithm
      },
      names: [csrParameters.subject],
    };
```

This gets processed by https://github.com/cloudflare/cfssl/blob/master/csr/csr.go

`cfssl` uses golang crypto/x509 libraries

So to create the CSR object, it uses a type defined in that library: `pkix.Name`

In https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L167:

```go
// Name returns the PKIX name for the request.
func (cr *CertificateRequest) Name() pkix.Name {
	var name pkix.Name
	name.CommonName = cr.CN

	for _, n := range cr.Names {
		appendIf(n.C, &name.Country)
		appendIf(n.ST, &name.Province)
		appendIf(n.L, &name.Locality)
		appendIf(n.O, &name.Organization)
		appendIf(n.OU, &name.OrganizationalUnit)
	}
	name.SerialNumber = cr.SerialNumber
	return name
}
```

It also uses this type in https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L279:

```go
// getNames returns an array of Names from the certificate
// It onnly cares about Country, Organization, OrganizationalUnit, Locality, Province
func getNames(sub pkix.Name) []Name {
```


Now, the code for parsing out info from a CSR is at
https://github.com/cloudflare/cfssl/blob/master/certinfo/certinfo.go

Here it has a Name struct:

https://github.com/cloudflare/cfssl/blob/master/certinfo/certinfo.go#L33

```go
// Name represents a JSON description of a PKIX Name
type Name struct {
	CommonName         string        `json:"common_name,omitempty"`
	SerialNumber       string        `json:"serial_number,omitempty"`
	Country            string        `json:"country,omitempty"`
	Organization       string        `json:"organization,omitempty"`
	OrganizationalUnit string        `json:"organizational_unit,omitempty"`
	Locality           string        `json:"locality,omitempty"`
	Province           string        `json:"province,omitempty"`
	StreetAddress      string        `json:"street_address,omitempty"`
	PostalCode         string        `json:"postal_code,omitempty"`
	Names              []interface{} `json:"names,omitempty"`
	//ExtraNames         []interface{} `json:"extra_names,omitempty"`
}

// ParseName parses a new name from a *pkix.Name
func ParseName(name pkix.Name) Name {
	n := Name{
		CommonName:         name.CommonName,
		SerialNumber:       name.SerialNumber,
		Country:            strings.Join(name.Country, ","),
		Organization:       strings.Join(name.Organization, ","),
		OrganizationalUnit: strings.Join(name.OrganizationalUnit, ","),
		Locality:           strings.Join(name.Locality, ","),
		Province:           strings.Join(name.Province, ","),
		StreetAddress:      strings.Join(name.StreetAddress, ","),
		PostalCode:         strings.Join(name.PostalCode, ","),
	}

	for i := range name.Names {
		n.Names = append(n.Names, name.Names[i].Value)
	}

	// ExtraNames aren't supported in Go 1.4
	// for i := range name.ExtraNames {
	// 	n.ExtraNames = append(n.ExtraNames, name.ExtraNames[i].Value)
	// }

	return n
}
```

The actual parsing is done at https://github.com/cloudflare/cfssl/blob/master/certinfo/certinfo.go#L126

```go
// ParseCSRPEM uses the helper to parse an x509 CSR PEM.
func ParseCSRPEM(csrPEM []byte) (*x509.CertificateRequest, error) {
	csrObject, err := helpers.ParseCSRPEM(csrPEM)
```

where https://github.com/cloudflare/cfssl/blob/master/helpers/helpers.go#L423 

calls an x509 library function

```go
	csrObject, err := x509.ParseCertificateRequest(block.Bytes)
```

https://golang.org/pkg/crypto/x509/#CertificateRequest

This CertificateRequest has a field `Subject pkix.Name`

https://golang.org/pkg/crypto/x509/pkix/#Name

>Name represents an X.509 distinguished name. This only includes the common elements of a DN. When parsing, all elements are stored in Names and non-standard elements can be extracted from there. When marshaling, elements in ExtraNames are appended and override other values with the same OID.

So this is the basic structure from which cfssl picks up the info.
When parsing a CSR, it will return the "non common elements" in the Names array, so that's why we can pick up the emailAddress from that Array.

**But it says that it could also pick up an emailAddress from the ExtraNames array.**

Now we have to see if cfssl *sends* this array when creating a CSR.

This type has a comment:

```go
ExtraNames []AttributeTypeAndValue // Go 1.5
```

SO, back to cfssl

https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L368
// Generate creates a new CSR from a CertificateRequest structure and
// an existing key. The KeyRequest field is ignored.
func Generate(priv crypto.Signer, req *CertificateRequest) (csr []byte, err error) {

called from
func ParseRequest(req *CertificateRequest) (csr, key []byte, err error) {

called from
// ProcessRequest validates and processes the incoming request. It is
// a wrapper around a validator and the ParseRequest function.
func (g *Generator) ProcessRequest(req *CertificateRequest) (csr, key []byte, err error) {

so the key here is the argument type CertificateRequest

On https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L376 if creates a new "instance" of the `x509.CertificateRequest` structure
	var tpl = x509.CertificateRequest{
		Subject:            req.Name(),
		SignatureAlgorithm: sigAlgo,
	}

`req.Name()` is a function that converts the Name struct from this csr.go file into a x509 Name struct:
https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L166

```go
func (cr *CertificateRequest) Name() pkix.Name {
	var name pkix.Name
	name.CommonName = cr.CN

	for _, n := range cr.Names {
		appendIf(n.C, &name.Country)
		appendIf(n.ST, &name.Province)
		appendIf(n.L, &name.Locality)
		appendIf(n.O, &name.Organization)
		appendIf(n.OU, &name.OrganizationalUnit)
	}
	name.SerialNumber = cr.SerialNumber
	return name
}
```


so we need to track that req.Name() to find if there's a chance to add an ExtraNames field there

We go back to https://github.com/cloudflare/cfssl/blob/master/cli/genkey/genkey.go who is the one calling ProcessRequest

https://github.com/cloudflare/cfssl/blob/master/cli/genkey/genkey.go#L26
`func genkeyMain(args []string, c cli.Config) (err error) {`

this creates the req parsing the json:

https://github.com/cloudflare/cfssl/blob/master/cli/genkey/genkey.go#L40

```go
	req := csr.CertificateRequest{
		KeyRequest: csr.NewBasicKeyRequest(),
	}
	err = json.Unmarshal(csrFileBytes, &req)
```

so back to the csr.go file https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L140

```go
// A CertificateRequest encapsulates the API interface to the
// certificate request functionality.
type CertificateRequest struct {
	CN           string
	Names        []Name     `json:"names" yaml:"names"`
	Hosts        []string   `json:"hosts" yaml:"hosts"`
	KeyRequest   KeyRequest `json:"key,omitempty" yaml:"key,omitempty"`
	CA           *CAConfig  `json:"ca,omitempty" yaml:"ca,omitempty"`
	SerialNumber string     `json:"serialnumber,omitempty" yaml:"serialnumber,omitempty"`
}
```
and where

```go
// A Name contains the SubjectInfo fields.
type Name struct {
	C            string // Country
	ST           string // State
	L            string // Locality
	O            string // OrganisationName
	OU           string // OrganisationalUnitName
	SerialNumber string
}
```

so to add the emailAddress we'd have to:

- add an emailAddress field to Name. The json parsing should be done automatically when sending this field in https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L32
- extend the Name() function to crate an ExtraNames array if the emailAddress is present https://github.com/cloudflare/cfssl/blob/master/csr/csr.go#L166
- I think that's it
