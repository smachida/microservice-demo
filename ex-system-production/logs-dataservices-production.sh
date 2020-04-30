#!/bin/bash

eval $(minikube docker-env)

echo "Checking the logs of the  data services in production env..."
docker-compose -f docker-compose-for-production.yaml logs -f $1

