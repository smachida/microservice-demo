#!/bin/bash

echo "Blue/Green deploy: old - 0%, new - 100%"
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/new/product-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/new/recommendation-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/new/review-routing-virtual-service.yaml

