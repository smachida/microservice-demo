#!/bin/bash
kubectl get secret pacific-tkc-dev-cluster1-ssh-password -o jsonpath='{.data.ssh-passwordkey}' | base64 -d
echo
