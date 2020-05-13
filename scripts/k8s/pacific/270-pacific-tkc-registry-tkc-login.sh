#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: ./300-pacific-tkc-login.sh <username>"
  exit 1
fi

kubectl vsphere login --server=172.17.137.1 --tanzu-kubernetes-cluster-name pacific-tkc-dev-cluster1 --tanzu-kubernetes-cluster-namespace ns-mapdemo-1 --vsphere-username $1 --insecure-skip-tls-verify
