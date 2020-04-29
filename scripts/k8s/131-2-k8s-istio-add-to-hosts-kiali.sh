#!/bin/bash
HOST=$(kubectl -n istio-system get service kiali -o jsonpath='{.spec.clusterIP}')
echo "$HOST kiali.istio-system.svc.cluster.local" | sudo tee -a /etc/hosts
