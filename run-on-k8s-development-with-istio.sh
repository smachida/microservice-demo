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

  echo "Deploying microservice-demo resource managers on k8s development env..."
  kubectl apply -f k8s-config/services/overlays/development/rabbitmq-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mongodb_product-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mongodb_recommendation-dev.yaml
  kubectl apply -f k8s-config/services/overlays/development/mysql-dev.yaml

  echo "Waiting for the managers to start up..."
  kubectl wait --timeout=600s --for=condition=ready pod --all

  echo "Deploying microservice-demo microservices on k8s development env..."
  kubectl apply -k k8s-config/services/overlays/development

  echo "Waiting for the deployments to be available..."
  kubectl wait --timeout=600s --for=condition=available deployment --all

  echo "Enabling istio service mesh..."
  kubectl get deployment auth-server product product-composite recommendation review -o yaml | istio-1.5.2/bin/istioctl kube-inject -f - | kubectl apply -f -

  echo "Waiting for the service mesh to start up..."
  waitForPods 5 'version=latest'

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=120s --for=condition=ready pod --all
fi

if [ $1 = "stop" ]; then
  echo "Deleting microservice-demo services  on k8s development env..."
  kubectl delete -k k8s-config/services/overlays/development
fi
