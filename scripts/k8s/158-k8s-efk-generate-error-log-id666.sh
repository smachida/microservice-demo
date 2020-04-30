#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

echo "Getting product info with id: 666..."
curl -H "Authorization: Bearer $ACCESS_TOKEN" -k 'https://minikube.me/product-composite/666?faultPercent=100'

