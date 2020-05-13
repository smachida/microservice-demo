#!/bin/bash
kubectl --kubeconfig=cluster-kubeconfig apply -f image-pull-secret.yaml
