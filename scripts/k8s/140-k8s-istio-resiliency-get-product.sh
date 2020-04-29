#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

for i in {1..6}; do time curl -k "https://minikube.me/product-composite/2" -H "Authorization: Bearer $ACCESS_TOKEN"; done
