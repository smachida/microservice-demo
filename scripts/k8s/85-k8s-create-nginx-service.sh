#!/bin/bash
kubectl apply -f nginx-service.yaml

hostname=$(minikube ip)
firefox http://$hostname:30080
