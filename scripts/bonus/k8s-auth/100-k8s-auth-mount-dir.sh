#!/bin/bash
unset KUBECONFIG

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

if [ $1 = "start" ]; then

  echo "Starting minikube ..."
  minikube start
  minikube mount $(pwd)/:/var/lib/localkube/certs/mini

fi

if [ $1 = "stop" ]; then
  echo "Stopping minikube ..."
  minikube stop 
fi

