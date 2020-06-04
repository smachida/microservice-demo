#!/bin/bash

#set -ex

if [ $# -ne 1 ]; then
  echo "引数に create もしくは delete を指定してください"
  exit 1
fi

if [ $1 = "create" ]; then

  echo "Creating Secrets for each databases / message queues ..."
  kubectl create secret generic rabbitmq-server-credentials --from-literal=RABBITMQ_DEFAULT_USER=guest --from-literal=RABBITMQ_DEFAULT_PASS=guest --save-config
  kubectl create secret generic rabbitmq-credentials --from-literal=SPRING_RABBITMQ_USERNAME=guest --from-literal=SPRING_RABBITMQ_PASSWORD=guest --save-config
  kubectl create secret generic rabbitmq-zipkin-credentials --from-literal=RABBIT_USER=guest --from-literal=RABBIT_PASSWORD=guest --save-config
  kubectl create secret generic mongodb-server-credentials --from-literal=MONGO_INITDB_ROOT_USERNAME=vmware --from-literal=MONGO_INITDB_ROOT_PASSWORD=password --save-config
  kubectl create secret generic mongodb-credentials --from-literal=SPRING_DATA_MONGODB_AUTHENTICATION_DATABASE=admin --from-literal=SPRING_DATA_MONGODB_USERNAME=vmware --from-literal=SPRING_DATA_MONGODB_PASSWORD=password --save-config
  kubectl create secret generic mysql-server-credentials --from-literal=MYSQL_ROOT_PASSWORD=password --from-literal=MYSQL_DATABASE=review-db --from-literal=MYSQL_USER=vmware --from-literal=MYSQL_PASSWORD=password --save-config
  kubectl create secret generic mysql-credentials --from-literal=SPRING_DATASOURCE_USERNAME=vmware --from-literal=SPRING_DATASOURCE_PASSWORD=password --save-config

fi

if [ $1 = "delete" ]; then

  echo "Deleting Secrets for each databases / message queues ..."
  kubectl delete secret rabbitmq-server-credentials
  kubectl delete secret rabbitmq-credentials
  kubectl delete secret rabbitmq-zipkin-credentials
  kubectl delete secret mongodb-server-credentials
  kubectl delete secret mongodb-credentials
  kubectl delete secret mysql-server-credentials
  kubectl delete secret mysql-credentials
fi

