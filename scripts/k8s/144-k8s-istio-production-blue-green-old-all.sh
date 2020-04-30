#!/bin/bash

echo "Blue/Green deploy: old - 100%, new - 0%"
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/old/product-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/old/recommendation-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/old/review-routing-virtual-service.yaml

