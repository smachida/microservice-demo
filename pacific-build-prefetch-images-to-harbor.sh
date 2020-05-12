#!/bin/bash

HARBOR_HOST=172.17.137.2
NAMESPACE=ns-mapdemo-1

echo "pushing the images to the registry: $HARBOR_HOST"
docker-credential-vsphere login $HARBOR_HOST

docker tag microservice-demo/product-service $HARBOR_HOST/$NAMESPACE/microservice-demo/product-service
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/product-service
docker tag microservice-demo/recommendation-service $HARBOR_HOST/$NAMESPACE/microservice-demo/recommendation-service
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/recommendation-service
docker tag microservice-demo/review-service $HARBOR_HOST/$NAMESPACE/microservice-demo/review-service
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/review-service
docker tag microservice-demo/product-composite-service $HARBOR_HOST/$NAMESPACE/microservice-demo/product-composite-service
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/product-composite-service
docker tag microservice-demo/auth-server $HARBOR_HOST/$NAMESPACE/microservice-demo/auth-server
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/auth-server
docker tag microservice-demo/gateway $HARBOR_HOST/$NAMESPACE/microservice-demo/gateway
docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/gateway

