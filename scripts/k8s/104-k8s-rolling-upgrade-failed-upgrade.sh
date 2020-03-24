#!/bin/bash
kubectl set image deployment/product product=microservice-demo/product-service:v3

