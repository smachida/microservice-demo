#!/bin/bash

unset DOCKER_TLS_VERIFY
unset DOCKER_HOST
unset DOCKER_CERT_PATH

./build-skipTests.sh
COMPOSE_FILE=docker-compose.yaml ./scripts/08-test-em-all-k8s.sh start stop
