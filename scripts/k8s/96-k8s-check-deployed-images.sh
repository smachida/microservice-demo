#!/bin/bash
kubectl get pods -o json | jq .items[].spec.containers[].image | sort
