openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -subj "/CN=10.65.0.1" -days 10000 -out ca.crt

openssl genrsa -out apiserver.key 2048
openssl req -new -key apiserver.key -out apiserver.csr -config apiserver_csr.conf
openssl x509 -req -in apiserver.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out apiserver.crt -days 10000 -extensions v3_ext -extfile apiserver_csr.conf

openssl genrsa -out sa.key 2048
openssl req -new -key sa.key -out sa.csr -config sa.conf
openssl x509 -req -in sa.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out sa.crt -days 10000 -extensions v3_ext -extfile sa.conf

