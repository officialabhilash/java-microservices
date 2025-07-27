#!/usr/bin/env bash

echo "Kafka is up. Creating topics..."

echo "Running kafka script for creating topics after initialization"
/opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic USER-REGISTERED --partitions 1
/opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic USER-VERIFICATION-SUCCESSFUL --partitions 1