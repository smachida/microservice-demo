#!/bin/bash
docker run --rm -it --network=my-network alpine wget product-composite:8080/actuator/health -qO - | jq -r .components.circuitBreakers.details.product.details.state
