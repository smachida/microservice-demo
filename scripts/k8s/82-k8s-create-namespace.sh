#!/bin/bash
kubectl create namespace my-ns-1
kubectl config set-context $(kubectl config current-context) --namespace=my-ns-1
