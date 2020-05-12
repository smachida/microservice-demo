#!/bin/bash
kubectl create ns istio-system
kubectl apply -f rolebinding-priviledged-so-ns_istio-system.yaml
