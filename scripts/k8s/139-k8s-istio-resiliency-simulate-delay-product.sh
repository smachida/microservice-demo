#!/bin/bash


if [ $# -ne 1 ]; then
  echo "引数に enable もしくは disable を指定してください"
  exit 1
fi

if [ $1 = "enable" ]; then

  echo "Enabling Product VirtualService with delay..."
  kubectl apply -f ../../k8s-config/resilience-tests/product-virtual-service-with-delay.yaml
fi

if [ $1 = "disable" ]; then

  echo "Disabling Product VirtualService with delay..."
  kubectl delete -f ../../k8s-config/resilience-tests/product-virtual-service-with-delay.yaml
fi

