#!/bin/bash
kubectl get secret -n ns-mapdemo-1 ns-mapdemo-1-default-image-pull-secret -o yaml > image-pull-secret.yaml
