#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数を1つ(エラー率: 1-100％)指定してください。" 1>&2
  exit 1
fi

time curl -H "Authorization: Bearer $ACCESS_TOKEN" -k https://localhost:8443/product-composite/2?faultPercent=$1 -w "%{http_code}\n" -o /dev/null -s
