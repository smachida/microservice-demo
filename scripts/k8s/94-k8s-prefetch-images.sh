#!/bin/bash
eval $(minikube docker-env)
echo $DOCKER_HOST
echo "pulling images ..."

docker pull mysql:5.7
docker pull mongo:3.6.9
docker pull mongo:latest
docker pull rabbitmq:3.7.8-management
docker pull openzipkin/zipkin:2.12.9
docker pull openjdk:latest
docker pull openjdk:12.0.2
