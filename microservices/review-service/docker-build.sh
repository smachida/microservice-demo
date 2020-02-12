#!/bin/bash
docker build -t review-service .
docker images | grep review-service
