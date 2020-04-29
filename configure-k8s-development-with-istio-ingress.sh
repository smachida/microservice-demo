#!/bin/bash

#set -ex

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Creating secret for istio-ingressgateway-certs..."
  kubectl create -n istio-system secret tls istio-ingressgateway-certs --key k8s-config/cert/tls.key --cert k8s-config/cert/tls.crt

  echo "Creating confing maps for each microservices ..."
  kubectl create configmap config-repo-auth-server --from-file=config-repo/application.yaml --from-file=config-repo/auth-server.yaml --save-config
  kubectl create configmap config-repo-gateway --from-file=config-repo/application.yaml --from-file=config-repo/gateway.yaml --save-config
  kubectl create configmap config-repo-product-composite --from-file=config-repo/application.yaml --from-file=config-repo/product-composite.yaml --save-config
  kubectl create configmap config-repo-product --from-file=config-repo/application.yaml --from-file=config-repo/product.yaml --save-config
  kubectl create configmap config-repo-recommendation --from-file=config-repo/application.yaml --from-file=config-repo/recommendation.yaml --save-config
  kubectl create configmap config-repo-review --from-file=config-repo/application.yaml --from-file=config-repo/review.yaml --save-config

  echo "Creating Secrets for each databases / message queues ..."
  kubectl create secret generic rabbitmq-server-credentials --from-literal=RABBITMQ_DEFAULT_USER=guest --from-literal=RABBITMQ_DEFAULT_PASS=guest --save-config
  kubectl create secret generic rabbitmq-credentials --from-literal=SPRING_RABBITMQ_USERNAME=guest --from-literal=SPRING_RABBITMQ_PASSWORD=guest --save-config
  kubectl create secret generic rabbitmq-zipkin-credentials --from-literal=RABBIT_USER=guest --from-literal=RABBIT_PASSWORD=guest --save-config
  kubectl create secret generic mongodb-server-credentials --from-literal=MONGO_INITDB_ROOT_USERNAME=vmware --from-literal=MONGO_INITDB_ROOT_PASSWORD=password --save-config
  kubectl create secret generic mongodb-credentials --from-literal=SPRING_DATA_MONGODB_AUTHENTICATION_DATABASE=admin --from-literal=SPRING_DATA_MONGODB_USERNAME=vmware --from-literal=SPRING_DATA_MONGODB_PASSWORD=password --save-config
  kubectl create secret generic mysql-server-credentials --from-literal=MYSQL_ROOT_PASSWORD=password --from-literal=MYSQL_DATABASE=review-db --from-literal=MYSQL_USER=vmware --from-literal=MYSQL_PASSWORD=password --save-config
  kubectl create secret generic mysql-credentials --from-literal=SPRING_DATASOURCE_USERNAME=vmware --from-literal=SPRING_DATASOURCE_PASSWORD=password --save-config

  echo "Creating Secret for TLS cert ..."
  kubectl create secret tls tls-certificate --key k8s-config/cert/tls.key --cert k8s-config/cert/tls.crt

fi

if [ $1 = "delete" ]; then

  echo "Deleting confing maps for each microservices ..."
  kubectl delete configmap config-repo-auth-server
  kubectl delete configmap config-repo-gateway
  kubectl delete configmap config-repo-product-composite
  kubectl delete configmap config-repo-product
  kubectl delete configmap config-repo-recommendation
  kubectl delete configmap config-repo-review

  echo "Deleting Secrets for each databases / message queues ..."
  kubectl delete secret rabbitmq-server-credentials
  kubectl delete secret rabbitmq-credentials
  kubectl delete secret rabbitmq-zipkin-credentials
  kubectl delete secret mongodb-server-credentials
  kubectl delete secret mongodb-credentials
  kubectl delete secret mysql-server-credentials
  kubectl delete secret mysql-credentials

  echo "Deletting Secret for TLS cert ..."
  kubectl delete secret tls-certificate

  echo "Deleting Secret for TLS cert for istio ingress gateway..."
  kubectl delete -n istio-system secret istio-ingressgateway-certs
fi

