#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

siege "https://minikube.me/product-composite/2" -H "Authorization: Bearer $ACCESS_TOKEN" -v -c1 -d1
