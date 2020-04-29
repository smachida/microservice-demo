#!/bin/bash


if [ $# -ne 1 ]; then
  echo "引数に enable もしくは disable を指定してください"
  exit 1
fi

if [ $1 = "enable" ]; then

  echo "Enabling JWT Policy..."
  kubectl apply -f ../../k8s-config/services/base/istio/jwt-authentication-policy.yaml
fi

if [ $1 = "disable" ]; then

  echo "Disabling JWT Policy..."
  kubectl delete -f ../../k8s-config/services/base/istio/jwt-authentication-policy.yaml
fi

echo "Tyring to get product info without an access token..."
curl https://minikube.me/product-composite/2 -kw "HTTP Code: %{http_code}\n"
