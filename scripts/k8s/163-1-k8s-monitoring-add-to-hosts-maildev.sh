#!/bin/bash
HOST=$(kubectl -n microservice-demo get service mail-server -o jsonpath='{.spec.clusterIP}')
echo "$HOST mail-server.microservice-demo.svc.cluster.local" | sudo tee -a /etc/hosts
