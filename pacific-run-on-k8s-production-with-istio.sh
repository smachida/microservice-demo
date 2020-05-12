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

  echo "Creating configurations..."
  ./pacific-configure-k8s-manage-namespace.sh create
  ./pacific-configure-k8s-production-with-istio-ingress.sh create

  HARBOR_HOST=172.17.137.2
  NAMESPACE=ns-mapdemo-1

  echo "tagging the images in the registry: $HARBOR_HOST"
  docker-credential-vsphere login $HARBOR_HOST

  # Deploy v1 Services
  echo "Deploying microservice-demo v1 microservices on k8s production env(Pacific)..."
  docker tag $HARBOR_HOST/$NAMESPACE/microservice-demo/auth-server               $HARBOR_HOST/$NAMESPACE/microservice-demo/auth-server:v1
  docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/auth-server:v1 
  docker tag $HARBOR_HOST/$NAMESPACE/microservice-demo/product-composite-service $HARBOR_HOST/$NAMESPACE/microservice-demo/product-composite-service:v1
  docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/product-composite-service:v1
  docker tag $HARBOR_HOST/$NAMESPACE/microservice-demo/product-service           $HARBOR_HOST/$NAMESPACE/microservice-demo/product-service:v1
  docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/product-service:v1
  docker tag $HARBOR_HOST/$NAMESPACE/microservice-demo/recommendation-service    $HARBOR_HOST/$NAMESPACE/microservice-demo/recommendation-service:v1
  docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/recommendation-service:v1
  docker tag $HARBOR_HOST/$NAMESPACE/microservice-demo/review-service            $HARBOR_HOST/$NAMESPACE/microservice-demo/review-service:v1
  docker push $HARBOR_HOST/$NAMESPACE/microservice-demo/review-service:v1

  kubectl apply -k k8s-config/services/base/services
  kubectl apply -k k8s-config/services/overlays/production/v1/pacific
  kubectl apply -k k8s-config/services/overlays/production/istio

  echo "Waiting for the v1 deployments to be available..."
  kubectl wait --timeout=600s --for=condition=available deployment --all

  echo "Enabling istio service mesh..."
  kubectl get deployment auth-server-v1 product-v1 product-composite-v1 recommendation-v1 review-v1 -o yaml | istio-1.5.2/bin/istioctl kube-inject -f - | kubectl apply -f -

  echo "Waiting for the service mesh to start up..."
  waitForPods 5 'version=v1'

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=120s --for=condition=ready pod --all

fi

if [ $1 = "stop" ]; then
  echo "Deleting microservice-demo microservies...  on k8s production env..."

  ./pacific-configure-k8s-manage-namespace.sh delete
  ./pacific-configure-k8s-manage-namespace.sh create
  
fi
