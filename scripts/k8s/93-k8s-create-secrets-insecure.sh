#!/bin/bash
kubectl create secret generic config-server-secrets --from-literal=ENCRYPT_KEY=my-very-secure-encrypt-key --from-literal=SPRING_SECURITY_USER_NAME=vmware --from-literal=SPRING_SECURITY_USER_PASSWORD=password --save-config

kubectl create secret generic config-client-credentials --from-literal=CONFIG_SERVER_USR=vmware --from-literal=CONFIG_SERVER_PWD=password --save-config
