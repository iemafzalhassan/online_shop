#!/bin/bash

# Pull the latest image
echo "Pulling the latest image..."
docker pull ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest || {
  echo "Failed to pull the latest image"
  exit 1
}

# Start the container
echo "Starting the container..."
docker-compose up -d || {
  echo "Failed to start using docker-compose, trying docker run..."
  docker run -d --name online-shop-app -p 5173:5173 ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest || {
    echo "Failed to start the container"
    exit 1
  }
}

echo "Container started successfully"
exit 0