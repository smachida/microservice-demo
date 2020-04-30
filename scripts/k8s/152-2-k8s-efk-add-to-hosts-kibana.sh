#!/bin/bash
HOST=$(kubectl -n logging get service kibana -o jsonpath='{.spec.clusterIP}')
echo "$HOST kibana.logging.svc.cluster.local" | sudo tee -a /etc/hosts
