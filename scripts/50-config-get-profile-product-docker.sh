#!/bin/bash
curl https://vmware:password@localhost:8443/config/product/docker -ks | jq .

