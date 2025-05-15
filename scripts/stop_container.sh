#!/bin/bash

# Stop any running container
echo "Stopping any running containers..."
docker-compose down || true
docker stop online-shop-app || true
docker rm online-shop-app || true

echo "Container stopped successfully"
exit 0