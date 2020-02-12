#!/bin/bash
docker build -t product-composite-service .
docker images | grep product-composite-service
