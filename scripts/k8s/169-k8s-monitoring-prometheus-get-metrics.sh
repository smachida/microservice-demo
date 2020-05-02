#!/bin/bash
ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

curl http://product-composite.microservice-demo.svc.cluster.local:4004/actuator/prometheus -H "Authorization: Bearer $ACCESS_TOKEN" -s
