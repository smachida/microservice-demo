#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に 詳細を確認したい リビジョン番号 を指定してください"
  exit 1
fi


kubectl rollout history deployment product

echo "Checking the rollout history of revision $1 ..."
kubectl rollout history deployment product --revision=$1
