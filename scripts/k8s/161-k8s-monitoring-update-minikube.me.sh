#!/bin/bash
INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "$INGRESS_HOST minikube.me" | sudo tee -a /etc/hosts
