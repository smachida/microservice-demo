#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

function waitForPods() {

    set +x
    local expectedPodCount=$1
    local labelSelection=$2
    local sleepSec=10

    n=0
    echo "Do we have $expectedPodCount pods with the label '$labelSelection' yet?"
    actualPodCount=$(kubectl get pod -l $labelSelection -o json | jq ".items | length")
    until [[ $actualPodCount == $expectedPodCount ]]
    do
        n=$((n + 1))
        if [[ $n == 40 ]]
        then
            echo " Give up"
            exit 1
        else
            echo -n "${actualPodCount}!=${expectedPodCount}, sleep $sleepSec..."
            sleep $sleepSec
            echo -n ", retry #$n, "
            actualPodCount=$(kubectl get pod -l $labelSelection -o json | jq ".items | length")
        fi
    done
    echo "OK! ($actualPodCount=$expectedPodCount)"

    set -x
}

if [ $1 = "start" ]; then
  eval $(minikube docker-env)

  # Deploy v2 Services
  echo "Deploying microservice-demo v2 microservices on k8s production env..."
  docker tag microservice-demo/auth-server               microservice-demo/auth-server:v2
  docker tag microservice-demo/product-composite-service microservice-demo/product-composite-service:v2
  docker tag microservice-demo/product-service           microservice-demo/product-service:v2
  docker tag microservice-demo/recommendation-service    microservice-demo/recommendation-service:v2
  docker tag microservice-demo/review-service            microservice-demo/review-service:v2

  kubectl apply -k k8s-config/services/overlays/production/v2

  echo "Waiting for the v2 deployments to be available..."
  kubectl wait --timeout=600s --for=condition=available deployment --all

  echo "Enabling istio service mesh..."
  kubectl get deployment auth-server-v2 product-v2 product-composite-v2 recommendation-v2 review-v2 -o yaml | istio-1.5.2/bin/istioctl kube-inject -f - | kubectl apply -f -

  echo "Waiting for the service mesh to start up..."
  waitForPods 5 'version=v2'

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=120s --for=condition=ready pod --all
fi

if [ $1 = "stop" ]; then
  echo "Deleting microservice-demo v2 microservies...  on k8s production env..."

  kubectl delete -k k8s-config/services/overlays/production/v2
fi
