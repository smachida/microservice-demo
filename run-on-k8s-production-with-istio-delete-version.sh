#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に バージョン を指定してください(ex. v1)"
  exit 1
fi

echo "Deleting microservice-demo with the specified version $1: on k8s production env..."

kubectl delete -k k8s-config/services/overlays/production/$1
