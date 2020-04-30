#!/bin/bash
eval $(minikube docker-env)
echo $DOCKER_HOST
echo "build fluentd image ..."

cd ../../
docker build -f k8s-config/efk/Dockerfile -t microservice-demo/fluentd:v1 k8s-config/efk/
