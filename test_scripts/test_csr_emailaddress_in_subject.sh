LOG_LEVEL="${LOG_LEVEL:-1}"

cat <<EOF > /tmp/config.json
{"signing":{"default":{"expiry":"43800h","usages":["signing","key encipherment","client auth"]}}}
EOF

cat <<EOF > /tmp/csr_dup.json
{
  "CN":"hub.test.mowali.com",
  "hosts":[
    "hub1.test.mowali.com",
    "hub2.test.mowali.com",
    "163.10.5.24",
    "163.10.5.22",
    "beatrice.wagate@mowali.com"
    ],
  "key":{
    "size":4096,
    "algo":"rsa"
  },
  "names":[
    {
      "CN":"hub.test.mowali.com",
      "O":"Mowali",
      "OU":"PKI"
    }
  ]
}
EOF


cat /tmp/csr_dup.json \
| bin/cfssl genkey -loglevel $LOG_LEVEL -config=/tmp/config.json - \
| jq -r '.csr' \
| openssl req  -text -noout \
| grep "DNS:hub1.test.mowali.com, DNS:hub2.test.mowali.com, email:beatrice.wagate@mowali.com, IP Address:163.10.5.24, IP Address:163.10.5.22"

if [ $? -ne 0 ]; then
    echo "test $0 failed. See log output"
    exit -1
else
    echo "test $0 passed"
fi



