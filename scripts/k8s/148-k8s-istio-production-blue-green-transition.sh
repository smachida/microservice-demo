#!/bin/bash

echo "Blue/Green transitioning to: old - v2, new - v3"

echo "Switching to ..."
./144-k8s-istio-production-blue-green-old-all.sh
kubectl apply -f ../../k8s-config/services/overlays/production/istio/blue-green/version-mapping/old_new_subsets_destination_rules.yaml

cd ../../
./run-on-k8s-production-with-istio-delete-version.sh v1
