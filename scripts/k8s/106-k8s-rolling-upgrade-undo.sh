#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に ロールバックしたい リビジョン番号 を指定してください"
  exit 1
fi

kubectl rollout history deployment product

echo "Rolling back to revision $1 ..."
kubectl rollout undo deployment product --to-revision=$1
