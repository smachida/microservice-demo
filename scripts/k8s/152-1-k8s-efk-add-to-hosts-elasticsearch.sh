#!/bin/bash
HOST=$(kubectl -n logging get service elasticsearch -o jsonpath='{.spec.clusterIP}')
echo "$HOST elasticsearch.logging.svc.cluster.local" | sudo tee -a /etc/hosts
