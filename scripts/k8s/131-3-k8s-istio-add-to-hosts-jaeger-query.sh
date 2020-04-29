#!/bin/bash
HOST=$(kubectl -n istio-system get service jaeger-query -o jsonpath='{.spec.clusterIP}')
echo "$HOST jaeger-query.istio-system.svc.cluster.local" | sudo tee -a /etc/hosts
