#!/bin/bash

echo "Configuring grafana for sending emails to maildev ..."
kubectl -n istio-system set env deployment/grafana GF_SMTP_ENABLED=true GF_SMTP_SKIP_VERIFY=true GF_SMTP_HOST=mail-server.microservice-demo.svc.cluster.local:25 GF_SMTP_FROM_ADDRESS=grafana@minikube.me

echo "Waiting for grafana to become readly..."
kubectl -n istio-system wait --timeout=60s --for=condition=ready pod -l app=grafana

