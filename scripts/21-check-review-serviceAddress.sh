#!/bin/bash
curl localhost:8080/product-composite/1 -s | jq -r .serviceAddresses

