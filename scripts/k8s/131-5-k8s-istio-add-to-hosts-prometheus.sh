#!/bin/bash
HOST=$(kubectl -n istio-system get service prometheus -o jsonpath='{.spec.clusterIP}')
echo "$HOST prometheus.istio-system.svc.cluster.local" | sudo tee -a /etc/hosts
