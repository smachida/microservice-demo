#!/bin/bash
unset KUBECONFIG

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

if [ $1 = "start" ]; then

  echo "Starting minikube ..."
  minikube start --extra-config=apiserver.basic-auth-file=/var/lib/localkube/certs/mini/users.csv -v9
  #minikube start --extra-config="apiserver.Authentication.PasswordFile.BasicAuthFile=/var/lib/localkube/certs/mini/users.csv" 

fi

if [ $1 = "stop" ]; then
  echo "Stopping minikube ..."
  minikube stop 
fi

