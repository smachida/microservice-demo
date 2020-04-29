#!/bin/bash
HOST=$(kubectl -n istio-system get service grafana -o jsonpath='{.spec.clusterIP}')
echo "$HOST grafana.istio-system.svc.cluster.local" | sudo tee -a /etc/hosts
