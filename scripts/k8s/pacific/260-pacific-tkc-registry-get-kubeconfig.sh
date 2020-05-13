#!/bin/bash
kubectl get secret -n ns-mapdemo-1 pacific-tkc-dev-cluster1-kubeconfig -o jsonpath='{.data.value}' | base64 -d > cluster-kubeconfig

