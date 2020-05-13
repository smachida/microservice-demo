#!/bin/bash
cd ../../..

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Creating secret for embedded harbor registry ..."
  kubectl create secret docker-registry microservice-demo-registry-secret --docker-server=172.17.137.2 --docker-username=devuser1@pacific.local --docker-password="Vmware1!" --docker-email=devuser1@pacific.local 
fi

if [ $1 = "delete" ]; then

  echo "Deleting secret for embedded harbor registry ..."
  kubectl delete secret microservice-demo-registry-secret
fi

