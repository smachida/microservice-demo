#!/bin/bash
curl -H "accept:application/json" localhost:8080/eureka/api/apps -s | jq -r .applications.application[].instance[].instanceId
