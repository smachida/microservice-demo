#!/bin/bash
cd ../..

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then
  echo "Creating namespace..."

  # 1. Deploy Fluentd
  echo "Deploying Fluentd..."
  kubectl apply -f k8s-config/efk/fluentd-microservice-demo-configmap.yaml
  kubectl apply -f k8s-config/efk/fluentd-ds.yaml

  echo "Waiting for Fluentd to become ready..."
  kubectl -n kube-system wait --timeout=120s --for=condition=ready pod -l app=fluentd

fi

if [ $1 = "delete" ]; then

  echo "Deleting Fluentd ..."
  kubectl delete -f k8s-config/efk/fluentd-ds.yaml
  kubectl delete -f k8s-config/efk/fluentd-microservice-demo-configmap.yaml
fi

