#!/bin/bash
echo "pulling images ..."

docker pull mysql:5.7
docker pull mongo:3.6.9
docker pull mongo:latest
docker pull rabbitmq:3.7.8-management

HARBOR_HOST=172.17.137.2
NAMESPACE=ns-mapdemo-1

echo "pushing the images to the registry: $HARBOR_HOST"
docker-credential-vsphere login $HARBOR_HOST

docker tag mysql:5.7 $HARBOR_HOST/$NAMESPACE/mysql:5.7
docker push $HARBOR_HOST/$NAMESPACE/mysql:5.7
docker tag mongo:3.6.9 $HARBOR_HOST/$NAMESPACE/mongo:3.6.9
docker push $HARBOR_HOST/$NAMESPACE/mongo:3.6.9
docker tag mongo:latest $HARBOR_HOST/$NAMESPACE/mongo:latest
docker push $HARBOR_HOST/$NAMESPACE/mongo:latest
docker tag rabbitmq:3.7.8-management $HARBOR_HOST/$NAMESPACE/rabbitmq:3.7.8-management
docker push $HARBOR_HOST/$NAMESPACE/rabbitmq:3.7.8-management
