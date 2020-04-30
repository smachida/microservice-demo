#!/bin/bash


if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Creating microservice-demo namespace..."

  kubectl create namespace microservice-demo
  kubectl config set-context $(kubectl config current-context) --namespace=microservice-demo
fi

if [ $1 = "delete" ]; then

  echo "Deleting microservice-demo namespace..."
 
  kubectl delete namespace microservice-demo
fi

