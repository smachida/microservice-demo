#!/bin/bash
cd ../..
for i in istio-1.5.2/install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
