#!/bin/bash
cd ../../..

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Deploying istio-demo ..."
  kubectl apply -f istio-1.5.2/install/kubernetes/istio-demo.yaml


  echo "Waiting for its Istio deployments to become available..."
  kubectl -n istio-system wait --timeout=600s --for=condition=available deployment --all
fi

if [ $1 = "delete" ]; then

  echo "Deleting istio-demo ..."
  kubectl delete -f istio-1.5.2/install/kubernetes/istio-demo.yaml
fi

