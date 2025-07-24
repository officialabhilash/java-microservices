#!/bin/bash

echo "=== Restarting Microservices ==="

# Stop and remove existing containers
echo "1. Stopping existing containers..."
docker-compose down

# Remove any existing volumes (optional - uncomment if you want fresh data)
# echo "2. Removing existing volumes..."
# docker volume prune -f

# Build and start services
echo "2. Building and starting services..."
docker-compose up --build -d

# Wait for services to be ready
echo "3. Waiting for services to be ready..."
sleep 10

# Check service status
echo "4. Checking service status..."
docker-compose ps

echo "=== Restart Complete ===" 