#!/bin/bash
cd ../..

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then
  echo "Creating namespace..."
  kubectl create namespace logging

  # 1. Deploy Elasticsearch
  echo "Deploying Elasticsearch..."
  kubectl apply -f k8s-config/efk/elasticsearch.yaml -n logging

  echo "Waiting for Elasticsearch to become ready..."
  kubectl -n logging wait --timeout=120s --for=condition=ready pod --all

  # 2. Deploy Kibana
  echo "Deploying Kibana..."
  kubectl apply -f k8s-config/efk/kibana.yaml -n logging

  echo "Waiting for Kibana to become ready..."
  kubectl -n logging wait --timeout=120s --for=condition=ready pod --all
 

fi

if [ $1 = "delete" ]; then

  echo "Deleting EFK stack ..."
  kubectl delete namespace logging
fi

