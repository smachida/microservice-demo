#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

if [ $1 = "start" ]; then

  echo "Deploying microservice-demo resource managers on k8s development env..."
  kubectl apply -f k8s-config/services/overlays/development/rabbitmq-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mongodb_product-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mongodb_recommendation-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mysql-dev.yaml

  echo "Waiting for the managers to start up..."
  kubectl wait --timeout=600s --for=condition=ready pod --all

  echo "Deploying microservice-demo microservices on k8s development env..."
  kubectl apply -k k8s-config/services/overlays/development

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=600s --for=condition=ready pod --all
fi

if [ $1 = "stop" ]; then
  echo "Deleting microservice-demo services  on k8s development env..."
  kubectl delete -k k8s-config/services/overlays/development
fi
