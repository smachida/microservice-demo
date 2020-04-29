#!/bin/bash

KIALI_IP=10.105.121.232
GRAFANA_IP=10.111.14.12
JAEGER_IP=10.111.133.53

echo "Accessing kiali..."
curl -o /dev/null -s -L -w "%{http_code}" "http://${KIALI_IP}:20001/kiali/"
echo 

echo "Accessing grafana..."
curl -o /dev/null -s -L -w "%{http_code}" "http://${GRAFANA_IP}:3000"
echo 


echo "Accessing jaeger..."
curl -o /dev/null -s -L -w "%{http_code}" "http://${JAEGER_IP}:16686"
echo 
