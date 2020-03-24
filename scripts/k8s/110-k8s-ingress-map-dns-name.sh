#!/bin/bash

echo "Mapping \"minikube.me\" to the ip address of minikube instance ..."
sudo bash -c "echo $(minikube ip) minikube.me | tee -a /etc/hosts"
