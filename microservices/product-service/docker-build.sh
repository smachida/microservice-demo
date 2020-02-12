#!/bin/bash
docker build -t product-service .
docker images | grep product-service
