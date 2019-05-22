LOG_LEVEL="${LOG_LEVEL:-1}"

cat <<EOF > /tmp/mowali.csr
Certificate Request:
    Data:
        Version: 0 (0x0)
        Subject: emailAddress=Beatrice.Wagate@modusbox.com, C=CI, ST=Abidjan, L=Abidjan, O=Mowali, OU=Mowali, CN=stg0dmz0wso2am.casahubppp.live
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:ac:f9:89:b3:31:b7:b5:d9:ff:46:0b:70:b5:c9:
                    49:c8:72:68:80:e7:61:37:11:fd:98:16:0b:31:01:
                    4f:f0:85:e3:75:83:7e:6f:03:55:fb:02:cc:10:28:
                    c3:e7:c9:32:8a:a7:f3:d6:3c:bb:8e:6c:6b:2d:02:
                    48:ca:59:8e:22:c6:f8:9d:cd:ca:c2:9a:7f:55:2c:
                    5e:19:27:89:9f:65:f0:a3:48:a4:cb:36:20:75:ae:
                    d6:da:c4:84:bb:46:46:73:ff:76:e4:a8:5a:46:fb:
                    8a:91:5d:36:00:35:b5:39:5f:cd:9c:b7:7e:1d:84:
                    97:90:1e:44:59:37:b9:4e:da:82:98:60:d8:da:8d:
                    58:e6:83:4a:2b:69:c5:82:a8:05:2c:0d:29:cc:45:
                    55:e2:57:8c:a7:5a:b3:54:73:8c:8d:3c:49:dd:70:
                    15:d9:94:9e:59:4d:88:89:09:e2:8d:9a:25:e0:4c:
                    27:08:f3:fc:df:6b:0b:b3:ee:00:d7:5f:7b:93:ab:
                    6d:9a:79:aa:ec:9e:59:c8:0f:dc:e6:aa:60:57:55:
                    2f:16:e9:df:77:ef:d3:dc:48:3f:0c:a8:8c:35:2d:
                    01:f1:41:50:91:42:60:5e:6b:0c:c2:35:36:49:01:
                    d5:84:35:37:f5:3d:ad:1c:9a:07:19:17:61:f3:67:
                    1c:97:22:52:21:43:77:5a:a9:c6:51:a4:1e:01:1f:
                    0d:30:28:13:1a:38:77:91:92:2d:e4:dd:88:27:ee:
                    67:d5:c9:ad:ed:f2:d8:42:07:c1:75:00:0d:72:69:
                    50:cf:bf:ac:2d:4a:f9:28:f4:27:6a:5e:46:0b:e0:
                    9d:c1:97:df:15:eb:fe:11:7a:15:48:ac:cd:0b:bb:
                    7d:2d:5c:76:7e:16:dd:b2:df:a6:5b:65:e8:d1:c3:
                    92:7c:24:89:00:e0:f4:83:a9:05:06:c5:ed:5a:7e:
                    88:3e:7d:fb:0e:e2:75:9d:01:25:44:50:a4:a4:61:
                    d4:08:fd:44:5f:b4:8c:08:88:bd:b1:35:00:53:4c:
                    76:d4:3a:c7:87:77:91:2b:90:bf:fd:ae:4f:70:c1:
                    88:5d:e9:83:98:a7:f8:61:70:a7:63:37:61:53:08:
                    a9:54:e0:35:2d:e2:c5:71:b0:39:96:53:d4:d2:d0:
                    f9:1a:3f:80:68:c3:d2:4e:40:77:6e:48:7c:2d:55:
                    8e:13:32:a8:5e:1e:d2:ed:7f:ff:a0:5c:79:19:23:
                    e8:53:23:55:35:d9:de:13:a4:6e:bd:d2:39:20:c7:
                    6f:21:cc:f5:b4:00:a8:89:63:3e:db:ba:da:00:ab:
                    e1:51:f8:46:fd:94:8a:7c:ba:a6:d9:ff:c1:7a:a5:
                    5a:95:73
                Exponent: 65537 (0x10001)
        Attributes:
            a0:00
    Signature Algorithm: sha256WithRSAEncryption
         29:ec:6e:d7:e8:2d:fd:a2:b3:bd:48:29:7c:4b:7d:90:a0:ab:
         e2:6c:98:6c:d0:1c:d2:5d:0e:11:c1:2d:54:83:b1:1b:87:b5:
         aa:cf:a4:9b:4c:85:de:2c:9c:50:c9:dc:d4:d6:72:05:76:0b:
         a6:e3:be:15:e3:b1:af:cf:d8:1e:12:88:a2:96:b5:33:1f:bb:
         78:2d:c8:eb:37:43:2b:18:d3:f8:cc:05:ce:c6:d4:0e:02:16:
         39:d4:16:82:50:6e:dc:26:69:e4:ab:18:14:39:eb:2d:00:66:
         1f:e3:8a:ec:ad:71:9d:ed:12:00:cb:c5:f8:b5:df:88:47:9c:
         ea:dd:8c:ea:cb:6a:03:63:01:65:27:08:10:60:32:57:1c:45:
         32:74:0f:df:7f:9f:64:55:f4:15:00:26:d9:96:10:3c:fc:a4:
         c1:3e:d5:45:3e:22:da:9c:cd:66:1a:f7:77:98:d9:e9:29:b0:
         93:86:17:07:3b:10:98:cb:4b:d3:40:0b:9f:0a:c9:83:56:24:
         30:0e:23:f1:f0:2e:55:81:00:1b:25:6d:5e:29:10:19:d7:20:
         f9:6f:92:9e:56:c1:ca:cf:01:02:0f:3d:00:6e:45:8a:c7:1c:
         fe:78:37:28:29:17:53:44:b8:81:bd:aa:62:d4:27:0a:ee:81:
         33:0e:78:98:07:b5:75:e8:72:43:4b:4e:00:c5:95:0c:c4:11:
         ad:b1:c2:57:c2:4f:dc:4f:5e:96:b4:b6:ec:9a:17:35:17:f6:
         4d:60:23:e1:c7:85:ca:fa:2b:e1:22:8c:5b:27:7b:54:43:f7:
         46:5e:1c:37:33:c6:25:c5:7e:6a:9a:f7:14:bd:eb:56:d8:fc:
         41:aa:30:bc:19:19:1e:4e:4e:df:37:a1:80:32:a8:a6:b9:72:
         58:b1:09:a4:aa:07:4c:9f:b2:13:72:0b:84:4e:ac:03:e1:09:
         76:ab:23:24:2a:27:31:4a:11:58:a1:ac:03:2f:b2:8c:5d:3d:
         ac:99:8a:67:ab:1b:47:9f:ac:02:40:fc:a4:64:20:7f:2c:cd:
         23:bc:51:55:4e:e8:df:1c:6d:a0:ee:bc:07:19:6d:89:9e:a9:
         ab:ee:11:b4:f5:08:aa:cb:4b:5b:fa:d6:56:1c:9a:63:71:cc:
         16:8d:38:d4:36:9b:f6:27:e9:28:80:ea:79:ae:8e:31:9b:6c:
         78:4d:fa:01:75:ba:64:9e:e6:f5:8c:18:eb:6a:70:f7:79:b4:
         a4:1d:97:8b:59:ad:e6:8f:f0:d4:52:17:3b:34:6d:4f:aa:f2:
         83:de:27:c3:ea:6a:5a:45:ab:78:64:cb:9a:49:5f:4f:72:bd:
         92:5a:81:54:66:aa:e3:46
-----BEGIN CERTIFICATE REQUEST-----
MIIE7zCCAtcCAQAwgakxKzApBgkqhkiG9w0BCQEWHEJlYXRyaWNlLldhZ2F0ZUBt
b2R1c2JveC5jb20xCzAJBgNVBAYTAkNJMRAwDgYDVQQIDAdBYmlkamFuMRAwDgYD
VQQHDAdBYmlkamFuMQ8wDQYDVQQKDAZNb3dhbGkxDzANBgNVBAsMBk1vd2FsaTEn
MCUGA1UEAwwec3RnMGRtejB3c28yYW0uY2FzYWh1YnBwcC5saXZlMIICIjANBgkq
hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArPmJszG3tdn/RgtwtclJyHJogOdhNxH9
mBYLMQFP8IXjdYN+bwNV+wLMECjD58kyiqfz1jy7jmxrLQJIylmOIsb4nc3Kwpp/
VSxeGSeJn2Xwo0ikyzYgda7W2sSEu0ZGc/925KhaRvuKkV02ADW1OV/NnLd+HYSX
kB5EWTe5TtqCmGDY2o1Y5oNKK2nFgqgFLA0pzEVV4leMp1qzVHOMjTxJ3XAV2ZSe
WU2IiQnijZol4EwnCPP832sLs+4A1197k6ttmnmq7J5ZyA/c5qpgV1UvFunfd+/T
3Eg/DKiMNS0B8UFQkUJgXmsMwjU2SQHVhDU39T2tHJoHGRdh82cclyJSIUN3WqnG
UaQeAR8NMCgTGjh3kZIt5N2IJ+5n1cmt7fLYQgfBdQANcmlQz7+sLUr5KPQnal5G
C+CdwZffFev+EXoVSKzNC7t9LVx2fhbdst+mW2Xo0cOSfCSJAOD0g6kFBsXtWn6I
Pn37DuJ1nQElRFCkpGHUCP1EX7SMCIi9sTUAU0x21DrHh3eRK5C//a5PcMGIXemD
mKf4YXCnYzdhUwipVOA1LeLFcbA5llPU0tD5Gj+AaMPSTkB3bkh8LVWOEzKoXh7S
7X//oFx5GSPoUyNVNdneE6RuvdI5IMdvIcz1tACoiWM+27raAKvhUfhG/ZSKfLqm
2f/BeqValXMCAwEAAaAAMA0GCSqGSIb3DQEBCwUAA4ICAQAp7G7X6C39orO9SCl8
S32QoKvibJhs0BzSXQ4RwS1Ug7Ebh7Wqz6SbTIXeLJxQydzU1nIFdgum474V47Gv
z9geEoiilrUzH7t4LcjrN0MrGNP4zAXOxtQOAhY51BaCUG7cJmnkqxgUOestAGYf
44rsrXGd7RIAy8X4td+IR5zq3Yzqy2oDYwFlJwgQYDJXHEUydA/ff59kVfQVACbZ
lhA8/KTBPtVFPiLanM1mGvd3mNnpKbCThhcHOxCYy0vTQAufCsmDViQwDiPx8C5V
gQAbJW1eKRAZ1yD5b5KeVsHKzwECDz0AbkWKxxz+eDcoKRdTRLiBvapi1CcK7oEz
DniYB7V16HJDS04AxZUMxBGtscJXwk/cT16WtLbsmhc1F/ZNYCPhx4XK+ivhIoxb
J3tUQ/dGXhw3M8YlxX5qmvcUvetW2PxBqjC8GRkeTk7fN6GAMqimuXJYsQmkqgdM
n7ITcguETqwD4Ql2qyMkKicxShFYoawDL7KMXT2smYpnqxtHn6wCQPykZCB/LM0j
vFFVTujfHG2g7rwHGW2Jnqmr7hG09Qiqy0tb+tZWHJpjccwWjTjUNpv2J+kogOp5
ro4xm2x4TfoBdbpknub1jBjranD3ebSkHZeLWa3mj/DUUhc7NG1PqvKD3ifD6mpa
Rat4ZMuaSV9Pcr2SWoFUZqrjRg==
-----END CERTIFICATE REQUEST-----
EOF


cat <<EOF > /tmp/example-ca.pem
-----BEGIN CERTIFICATE-----
MIIFVzCCAz+gAwIBAgIUDh0sGLdLjosQ4EQClLHkI5wKGSswDQYJKoZIhvcNAQEN
BQAwODERMA8GA1UEChMITW9qYWxvb3AxDDAKBgNVBAsTA1BLSTEVMBMGA1UEAxMM
TW9qYWxvb3AgUEtJMB4XDTE5MDUyMTE0MzIwMFoXDTI0MDUxOTE0MzIwMFowODER
MA8GA1UEChMITW9qYWxvb3AxDDAKBgNVBAsTA1BLSTEVMBMGA1UEAxMMTW9qYWxv
b3AgUEtJMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA0aEfcQvqjqpu
c7w/ScFmcx5wYQGc3LQUbLEWbHfbEnjDPT7qS/83fM0yXbtV/taIfd37vGiJU9vq
eFBcGgXq6QNnNVicZkJ1Q4sfStXsJXq5JaB9XwymUKNlvhoXrasLh+lMCLjJv9i4
+NRjiNHO8hoxi/1hNh7j3DNRvGimm/HnIXUTIjv4CsoDZWPUSw/1PYn2HH3j07J5
h3uW/6UPrR0o+S8gtMYUnDrUiGWSyL/oz10Bk7AYyEBXyM7EK6gLuxnosuphVaNV
GTeO+Td3oNXkdiu6aPIFnFxwX6nxF36Q6fBgusoncAtQq8K4gGFtOu8EcjCkwiJQ
DOrcW786vAxofk6y664TLwZcG7ZU1wm+0MQRHj8MRIMv1ECQfFUyr9Q9dXS9pE5n
m8ElxxA5JsfujV5MAfTo+znNXSBoQXELHUMX8KtGo/6XUNINaV7Fstm4VPwKS3au
7c87nD0vAfbf07lofclS6elIZ0qnF4+4LwjVlSTFGDAEjdVDugAAiIc+SrheD1CJ
Nw1gj4WDT7Q/5c5NZOC6uwyr+3IkPYz/e2MOXJnz6Hzh/z5kKqOpPlBO8WfZeSMZ
gK4vyqzfbdOYmD2Dw2LDer8mxfuBFIl2aAgiZubqElVM0L7NMeZ3OBhZBMhcPZ7V
Sa77DMJnazVmmsDC0bTV1eQ1rkJDWp0CAwEAAaNZMFcwDgYDVR0PAQH/BAQDAgEG
MA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFGDy3d7HNcIUkgVAImN3RO+fKPrq
MBUGA1UdEQQOMAyHBKMKBRiHBKMKBRYwDQYJKoZIhvcNAQENBQADggIBAGZ+S211
ZeURNRk9Oje+8ZCb+Uqz2bxWG/DhlZvFLZKlh8XiEqLSGLcO0rMyp3IHwj30UkOb
/mkwhm6WhvBr7Nnlh73RXzs0UGzEBiRpLBSVuktt79oUzoEjzHKy/vOgyA93ehHb
wMW4Rnpbk147IpayyunQ15NBrcImYU9udQkOSCq62eALwNFOdyJktglSC5tT1+8O
jZu3Ic/LoNuJGmbpIUNIzkXRexDBiD4cUnXoAPwpV4H8HcjwesPc8I379se7l0lf
MZF2FMGRYflLS/LJ7+10qEP68BD8CFatUWsM74jvwfkpofvcl5wgDhQwTX10O1KV
U0sAhTLrOwPzzb6vMF/MWGEA0oyhTiDNHsDCsabu+uPHSERhqiIoFP22+nYdip97
QhAGociX3NpL5E7cmWGeT0Fit9cPbJa4tVMLUNsqIwwbX9+IGEmLVGl20nGl23Nl
AzhlMIACHTIvFvIZPSrdIQzHPZJqVK6ftripBl1Jl8iJ8wZ9Of4kbU5/fUVGh9Y2
yDw5qFnofApCaPg3Nu8ghnChaO/BuRvqUom18SmiNmSrNLDjv/jamskpJ7tf8a0N
9IgDzopb6mifmA4dBqMh3LfQZCcnOy5yQUWun1Wek83HAueD25z+LKHA5YNV9eXx
2+AzJkNirz1wsYNL984/LvkcCYLTiYfa/xmH
-----END CERTIFICATE-----
EOF

cat <<EOF > /tmp/example-ca-key.pem
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
EOF

cat <<EOF > /tmp/config.json
{"signing":{"default":{"expiry":"43800h","usages":["signing","key encipherment","client auth"]}}}
EOF


cat /tmp/mowali.csr \
| bin/cfssl sign -loglevel $LOG_LEVEL -ca /tmp/example-ca.pem -ca-key /tmp/example-ca-key.pem -config=/tmp/config.json - \
| jq -r '.cert' \
| openssl x509  -text -noout \
| grep -e "X509v3 Subject Alternative Name:
                email:Beatrice.Wagate@modusbox.com"


if [ $? -ne 0 ]; then
    echo "test $0 failed. See log output"
    exit -1
else
    echo "test $0 passed"
fi



