#!/bin/bash


if [ $# -ne 1 ]; then
  echo "引数に enable もしくは disable を指定してください"
  exit 1
fi

./138-1-k8s-istio-resiliency-simulate-faults-product.sh $1
./138-2-k8s-istio-resiliency-simulate-faults-recommendation.sh $1
./138-3-k8s-istio-resiliency-simulate-faults-review.sh $1
