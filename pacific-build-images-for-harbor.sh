#!/bin/bash
./gradlew build -x test && docker-compose -f docker-compose-for-k8s.yaml build
