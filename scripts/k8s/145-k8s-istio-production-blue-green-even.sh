#!/bin/bash

echo "Blue/Green deploy: old - 50%, new - 50%"
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/even/product-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/even/recommendation-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/even/review-routing-virtual-service.yaml

