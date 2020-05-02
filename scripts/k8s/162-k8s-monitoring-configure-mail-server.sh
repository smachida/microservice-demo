#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Deploying maildev ..."
  kubectl -n microservice-demo create deployment mail-server --image djfarrelly/maildev:1.1.0
  kubectl -n microservice-demo expose deployment mail-server --port=80,25 --type=ClusterIP

  echo "Waiting for its maildev pod to become readly..."
  kubectl -n microservice-demo wait --timeout=60s --for=condition=ready pod -l app=mail-server
fi

if [ $1 = "delete" ]; then

  echo "Deleting maildev ..."
  kubectl delete deployment mail-server
fi

