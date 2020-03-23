#!/bin/bash
unset KUBECONFIG

minikube addons enable ingress
minikube addons enable metrics-server
