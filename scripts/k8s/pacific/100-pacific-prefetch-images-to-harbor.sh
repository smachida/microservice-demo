#!/bin/bash
echo "pulling images ..."

docker pull mysql:5.7
docker pull mongo:3.6.9
docker pull mongo:latest
docker pull rabbitmq:3.7.8-management
docker pull openzipkin/zipkin:2.12.9
docker pull openjdk:latest
docker pull openjdk:12.0.2
docker pull busybox:latest

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
docker tag openzipkin/zipkin:2.12.9 $HARBOR_HOST/$NAMESPACE/openzipkin/zipkin:2.12.9
docker push $HARBOR_HOST/$NAMESPACE/openzipkin/zipkin:2.12.9
docker tag openjdk:latest $HARBOR_HOST/$NAMESPACE/openjdk:latest
docker push $HARBOR_HOST/$NAMESPACE/openjdk:latest
docker tag openjdk:12.0.2 $HARBOR_HOST/$NAMESPACE/openjdk:12.0.2
docker push $HARBOR_HOST/$NAMESPACE/openjdk:12.0.2
docker tag busybox:latest $HARBOR_HOST/$NAMESPACE/busybox:latest
docker push $HARBOR_HOST/$NAMESPACE/busybox:latest
