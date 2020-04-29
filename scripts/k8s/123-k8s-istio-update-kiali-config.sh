#!/bin/bash
cd ../..
kubectl -n istio-system apply -f k8s-config/istio/setup/kiali-configmap.yaml
kubectl -n istio-system delete pod -l app=kiali
kubectl -n istio-system wait --timeout=180s --for=condition=readly pod -l app=kiali
