#!/bin/bash
unset KUBECONFIG

minikube start --memory=16384 --cpus=4 --disk-size=30g --kubernetes-version=v1.17.3 --vm-driver=virtualbox

minikube addons enable ingress
minikube addons enable metrics-server
