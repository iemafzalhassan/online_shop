# Online Shop – Submission

## Project Overview
The repository contains a fully functional e-commerce application built to demonstrate foundational DevOps skills in three key areas:

- **Git & GitHub**
- **Linux**
- **Docker**

## Git & GitHub Workflow
I started by forking the repository to obtain a copy in my GitHub home page. Then, I created a feature branch named `featurebranch_online_shop_hackathon` from the source branch `Hackathon`. This branch was used to implement changes and create the Dockerfile.

## Setting Up the Linux Environment
Linux commands:

```sh
sudo apt-get update -y  # Updates the package lists for upgrades and new installations
sudo apt-get install docker.io -y # Installs Docker on the system
sudo systemctl status docker  # Checks if the Docker service is running
docker --version #checks the version of the docker
whoami  # Displays the current logged-in user
sudo usermod -aG docker $USER  # Adds the current user to the Docker group to allow running Docker commands without sudo
newgrp docker  # Refreshes the group membership for the current session
cat /etc/group # to see current user is connect with docker group

docker login -u julkar09  # Logs into Docker Hub (requires credentials I used access token)
```

## Cloning the Repository
After setting up Docker, I cloned the repository into my EC2 instance:

```sh
pwd  # Prints the current working directory (/home/ubuntu)
mkdir online-shopping  # Creates a new directory named 'online-shopping'
cd online-shopping  # Changes directory to 'online-shopping'
git init  # Initializes a new Git repository

git clone https://github.com/julkar09/online_shop.git  # Clones the specific branch of the repository

cd online_shop  # Navigates into the cloned repository

```

## Dockerfile Implementation
After cloning the repository, I started working on the Dockerfile. Initially, I drafted a basic version after analyzing the repository's code to determine the appropriate base image and port configuration.

### Dockerfile [base-image]
```Dockerfile
# Base image of Node
FROM node:18-alpine

# Set up the working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker layer caching
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port
EXPOSE 5173

# Command to start the application
CMD ["npm", "run", "dev"]
```

### Building and Running the Docker Container
```sh
docker build -t julkar09/online-shopping:00 .  # Builds the Docker image and tags 00 it as 'julkar09/online-shopping'

docker run -d -p 3000:5173 julkar09/online-shopping:00  # Runs the container in detached mode, mapping port 3000 on the host to port 5173 in the container
```

### Debugging and Container Management

To monitor and manage the running container, I used the following commands:

Checking Logs
```sh
docker logs container ID  # Displays the logs for the specified container ID
```
Stopping and Removing the Container
```sh
docker stop container ID && docker rm container ID # Stops and removes the container using its ID
```
Removing the Docker Image
```sh
docker rmi julkar09/online-shopping:00  # Removes the specified Docker image
```
## Key Changes & Enhancements: Docker Multi-Stage Optimization

After confirming the initial Dockerfile worked as expected, I focused on optimizing it using a multi-stage build approach to enhance efficiency and reduce the final image size.

## Optimized Dockerfile with Multi-Stage Build

```sh
# Build Stage: Used to install dependencies and build the application
FROM node:20-alpine AS build
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker caching
COPY package*.json ./

# Install all dependencies (including devDependencies for build)
RUN npm ci

# Copy application source code into the container
COPY . .

# Build the application using Vite
RUN npm run build

# Production Stage: Runs only the necessary code with a smaller base image
FROM node:20-slim AS production
WORKDIR /app

# Install 'serve' globally to serve the built app
RUN npm install -g serve && rm -rf /root/.npm

# Copy only necessary files from the build stage (excluding source code)
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/dist /app/dist

# Create a non-root user for better security
RUN useradd -m appuser && chown -R appuser /app
USER appuser
# Expose the application port
EXPOSE 5173

# Start the application using 'serve'
CMD ["serve", "-s", "dist", "-l", "5173"]

```
## Benefits of Multi-Stage Builds

1. Smaller Image Size
2. Cleaner Dockerfile
3. Improved Build Efficiency
4. No Need for Extra Build Tools in the Final Image
5. Flexibility
6. Security

## Pushing the Docker Image to Docker Hub

After building the Docker image, it can be pushed to Docker Hub for sharing and deployment.

### Steps to Push the Image:

Ensure you are logged into Docker Hub:
```sh
docker login -u julkar9  # Logs into Docker Hub 
```
Tag the Image Properly:
```sh
docker tag 789a36f18b14 julkar9/online-shopping:v1.0 # Tags the image 
```
Push the Image to Docker Hub:
```sh
push julkar9/online-shopping:v1.0  # Pushes the tagged image to Docker Hub
```
### Verifying the Image on Docker Hub

After pushing, the image can be checked on Docker Hub by visiting: Docker Hub - julkar9


## Final Submission Statement

This repository represents my final submission for Hackathon Phase 1.

GitHub Repository :
https://github.com/julkar09/online_shop/tree/online-shoppping

Branch: online-shoppping

Image: https://hub.docker.com/r/julkar9/online-shopping
docker pull julkar9/online-shopping

