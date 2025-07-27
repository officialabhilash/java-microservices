#!/usr/bin/env bash

SERVICES="$@"

docker compose -f docker-compose.yml stop $SERVICES
docker compose -f docker-compose.yml rm --force $SERVICES
docker compose -f docker-compose.yml up -d --build $SERVICES

if [[ " $SERVICES " =~ [[:space:]]kafka[[:space:]] ]]; then
  echo "Kafka service detected. Waiting for it to become healthy..."
  docker exec kafka bash /kafka_init_script.sh
else
  echo "Kafka service not requested. Skipping Kafka healthcheck and init script."
fi