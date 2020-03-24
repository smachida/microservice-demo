#!/bin/bash

if [ $# -ne 2 ]; then
  echo "引数にイメージの旧,新バージョン（vX）を指定してください"
  exit 1
fi


eval $(minikube docker-env)

#docker tag microservice-demo/auth-server:$1 microservice-demo/auth-server:$2
#docker tag microservice-demo/config-server:$1 microservice-demo/config-server:$2
#docker tag microservice-demo/gateway:$1 microservice-demo/gateway:$2
#docker tag microservice-demo/product-composite-service:$1 microservice-demo/product-composite-service:$2
docker tag microservice-demo/product-service:$1 microservice-demo/product-service:$2
#docker tag microservice-demo/recommendation-service:$1 microservice-demo/recommendation-service:$2
#docker tag microservice-demo/review-service:$1 microservice-demo/review-service:$2

