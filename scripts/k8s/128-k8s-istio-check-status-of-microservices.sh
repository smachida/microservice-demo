#!/bin/bash
PRODUCT_COMPOSITE_IP=XXX
echo "Checking the status of microservices..."
curl -k "http://${PRODUCT_COMPOSITE_IP}:4004/actuator/health"
echo
