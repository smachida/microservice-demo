#!/bin/bash

echo "Blue/Green deploy: old - 70%, new - 30%"
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/custom/product-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/custom/recommendation-routing-virtual-service.yaml
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/custom/review-routing-virtual-service.yaml

