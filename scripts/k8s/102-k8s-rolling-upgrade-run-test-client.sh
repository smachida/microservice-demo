#!/bin/bash
siege https://$(minikube ip):31443/actuator/health -c1 -d1 -v
