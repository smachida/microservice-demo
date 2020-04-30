#!/bin/bash

ACCESS_TOKEN=$(curl -k "https://writer:secret@minikube.me/oauth/token" -d grant_type=password -d username=vmware -d password=password -s | jq .access_token -r)
echo "Access token: $ACCESS_TOKEN"

echo "Creating a product info with id: 1234..."
curl -X POST -k "https://minikube.me/product-composite" -H "Content-Type: application/json" -H "Authorization: Bearer $ACCESS_TOKEN" --data '{"productId": 1234, "name": "product name 1234", "weight": 1234}'

echo "Getting product info with id: 1234..."
curl -H "Authorization: Bearer $ACCESS_TOKEN" -k 'https://minikube.me/product-composite/1234'

