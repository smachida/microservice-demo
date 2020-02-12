#!/bin/bash
docker build -t recommendation-service .
docker images | grep recommendation-service
