#!/bin/bash

echo "=== Testing PostgreSQL Database Connection ==="

# Check if containers are running
echo "1. Checking if containers are running..."
docker ps | grep -E "(postgres_db|user_backend)"

echo -e "\n2. Testing PostgreSQL connection from host..."
docker exec postgres_db pg_isready -U admin -d application

echo -e "\n3. Testing connection from user_backend container..."
docker exec user_backend pg_isready -h postgres_db -U admin -d application

echo -e "\n4. Checking PostgreSQL logs..."
docker logs postgres_db --tail 20

echo -e "\n5. Checking user_backend logs..."
docker logs user_backend --tail 20

echo -e "\n=== Connection Test Complete ===" 