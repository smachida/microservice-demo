#!/bin/bash
keytool -printcert -sslserver minikube.me:443 | grep "minikube.me"
