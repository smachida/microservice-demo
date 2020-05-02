#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

echo "Testing retry..."
while true; do curl -o /dev/null -s -L -w "%{http_code}\n" -H "Authorization: Bearer $ACCESS_TOKEN" -k https://minikube.me/product-composite/2?faultPercent=10; sleep 3; done
