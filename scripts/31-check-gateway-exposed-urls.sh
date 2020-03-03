#!/bin/bash
curl localhost:8080/actuator/gateway/routes -s | jq 

