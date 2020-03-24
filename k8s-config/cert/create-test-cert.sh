#!/bin/bash
openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=minikube.me/O=minikube.me"
