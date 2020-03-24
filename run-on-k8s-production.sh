#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

if [ $1 = "start" ]; then

  echo "Deploying microservice-demo services on k8s production env..."
  kubectl apply -k k8s-config/services/overlays/production

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=600s --for=condition=ready pod --all
fi

if [ $1 = "stop" ]; then
  echo "Deleting microservice-demo services on k8s production env..."
  kubectl delete -k k8s-config/services/overlays/production
fi
