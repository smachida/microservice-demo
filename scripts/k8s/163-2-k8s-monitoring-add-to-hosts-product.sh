#!/bin/bash
PRODUCT_COMPOSITE_HOST=$(kubectl -n microservice-demo get service product -o jsonpath='{.spec.clusterIP}')
echo "$PRODUCT_COMPOSITE_HOST product.microservice-demo.svc.cluster.local" | sudo tee -a /etc/hosts
