# node
export NODE_IP=$1
openssl genrsa -out cert/${NODE_IP}-key.pem 2048
openssl req -new -key cert/${NODE_IP}-key.pem -out ${NODE_IP}.csr -subj "/CN=node-${NODE_IP}" -config node.cnf
openssl x509 -req -in ${NODE_IP}.csr -CA cert/ca.pem -CAkey cert/ca-key.pem -CAcreateserial -out cert/${NODE_IP}.pem -days 365 -extensions v3_req -extfile node.cnf
rm -f ${NODE_IP}.csr






