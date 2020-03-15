#!/bin/bash
curl -k https://vmware:password@localhost:8443/config/decrypt -d $1
