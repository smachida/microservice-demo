#!/bin/bash
eval $(minikube docker-env)
echo $DOCKER_HOST
echo "pulling images ..."

docker pull docker.elastic.co/elasticsearch/elasticsearch-oss:7.3.0
docker pull docker.elastic.co/kibana/kibana-oss:7.3.0
