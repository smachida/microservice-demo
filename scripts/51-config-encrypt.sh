#!/bin/bash
curl -k https://vmware:password@localhost:8443/config/encrypt --data-urlencode $1
