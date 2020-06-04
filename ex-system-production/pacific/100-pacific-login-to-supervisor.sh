#!/bin/bash
kubectl vsphere login --server=https://172.17.137.1 --vsphere-username $1 --insecure-skip-tls-verify
