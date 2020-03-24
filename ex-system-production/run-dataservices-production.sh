#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に up もしくは down を指定してください"
  exit 1
fi

eval $(minikube docker-env)

if [ $1 = "up" ]; then
  echo "Starting up data services in production env..."
  docker-compose -f docker-compose-for-production.yaml $1 -d
fi

if [ $1 = "down" ]; then
  echo "shutting down data services in production env..."
  docker-compose -f docker-compose-for-production.yaml $1 
fi

