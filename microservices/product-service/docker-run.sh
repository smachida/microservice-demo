#!/bin/bash
docker run --rm -d -p 8080:8080 -e "SPRING_PROFILES_ACTIVE=docker" --name product product-service
