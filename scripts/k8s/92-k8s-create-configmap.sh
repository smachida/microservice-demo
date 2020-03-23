#!/bin/bash
kubectl create configmap config-repo --from-file=../../config-repo/ --save-config
