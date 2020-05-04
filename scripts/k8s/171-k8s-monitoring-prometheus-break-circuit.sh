#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

echo "Breaking circuit..."
for ((n=0; n<3; n++)); do curl -o /dev/null -skL -w "%{http_code}\n" https://minikube.me/product-composite/2?delay=3 -H "Authorization: Bearer $ACCESS_TOKEN" -s; done 

