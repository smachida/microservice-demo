#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数にイメージのバージョン（vX）を指定してください"
  exit 1
fi


eval $(minikube docker-env)

docker tag microservice-demo/auth-server microservice-demo/auth-server:$1
#docker tag microservice-demo/config-server microservice-demo/config-server:$1
#docker tag microservice-demo/gateway microservice-demo/gateway:$1
docker tag microservice-demo/product-composite-service microservice-demo/product-composite-service:$1
docker tag microservice-demo/product-service microservice-demo/product-service:$1
docker tag microservice-demo/recommendation-service microservice-demo/recommendation-service:$1
docker tag microservice-demo/review-service microservice-demo/review-service:$1

