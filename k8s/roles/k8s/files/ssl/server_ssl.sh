# ca
openssl genrsa -out cert/ca-key.pem 2048
openssl req -x509 -new -nodes -key cert/ca-key.pem -days 10000 -out cert/ca.pem -subj "/CN=kube-ca"
# api
openssl genrsa -out cert/apiserver-key.pem 2048
openssl req -new -key cert/apiserver-key.pem -out apiserver.csr -subj "/CN=kube-apiserver" -config api.cnf
openssl x509 -req -in apiserver.csr -CA cert/ca.pem -CAkey cert/ca-key.pem -CAcreateserial -out cert/apiserver.pem -days 365 -extensions v3_req -extfile api.cnf
rm -f apiserver.csr

# kube-scheduler 
openssl genrsa -out cert/scheduler-key.pem 2048
openssl req -new -key cert/scheduler-key.pem -out scheduler.csr -subj "/CN=kube-scheduler" -config scheduler.cnf
openssl x509 -req -in scheduler.csr -CA cert/ca.pem -CAkey cert/ca-key.pem -CAcreateserial -out cert/scheduler.pem -days 365 -extensions v3_req -extfile scheduler.cnf
rm -f scheduler.csr

# kube-controller-manager
openssl genrsa -out cert/controller-manager-key.pem 2048
openssl req -new -key cert/controller-manager-key.pem -out controller-manager.csr -subj "/CN=kube-controller-manager" -config controller-manager.cnf
openssl x509 -req -in controller-manager.csr -CA cert/ca.pem -CAkey cert/ca-key.pem -CAcreateserial -out cert/controller-manager.pem -days 365 -extensions v3_req -extfile controller-manager.cnf
rm -f controller-manager.csr





