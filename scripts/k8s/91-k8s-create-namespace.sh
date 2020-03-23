#!/bin/bash
kubectl create namespace microservice-demo
kubectl config set-context $(kubectl config current-context) --namespace=microservice-demo
