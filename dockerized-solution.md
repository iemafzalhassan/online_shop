# Online Shop – Hackathon Phase 1 Submission

## Overview

I am a student of Batch 9 of the Junnon batch, and I have successfully completed Phase 1 of my course. During this phase, I learned about Linux, networking, Git, GitHub, and Docker.

As part of my learning journey, Shubham and the team provided a hackathon challenge. The objective of the hackathon was to apply my knowledge and dockerize an online shop application.

## Pre-checks for Base Image Selection

Before choosing the base image for my Dockerfile, I performed the following checks:

- **Official Image**: I selected the official Node.js image from DockerHub to ensure security and reliability.
- **Alpine Variant**: I opted for `node:lts-alpine3.21` to reduce the image size while maintaining stability.
- **Zero Vulnerabilities**: I verified that the selected image had no known vulnerabilities.

## Docker Setup

Below is the Dockerfile used for containerizing my online shop application:

```dockerfile
# Use the official Node.js LTS version based on Alpine Linux 3.21
FROM node:lts-alpine3.21

# Create a new user 'appuser' without a home directory (-D)
RUN adduser -D appuser

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the project directory to the container's /app directory
COPY . /app

# Change ownership of the /app directory to the newly created user
RUN chown -R appuser:appuser /app

# Switch to the non-root user for better security
USER appuser

# Install project dependencies from package.json
RUN npm install

# Expose port 5173 for the application (used by Vite by default)
EXPOSE 5173

# Set the default command to start the application in development mode
CMD ["npm", "run", "dev"]
```

### Reference for Adding a User in Alpine Linux

For more information on adding a user in Alpine Linux and bypassing password assignment, refer to the following link:
[StackOverflow: How do I add a user when I'm using Alpine as a base image?](https://stackoverflow.com/questions/49955097/how-do-i-add-a-user-when-im-using-alpine-as-a-base-image)

## .dockerignore Setup

To avoid copying unnecessary files into the container, I created a `.dockerignore` file. This helps to reduce the image size and maintain a cleaner workspace inside the container.

Here is the content of my `.dockerignore` file:

```
.dockerignore
package-lock.json
Dockerfile
docker-compose.yml
```

## Building the Docker Image

To build the Docker image from the provided Dockerfile, run the following command:

```sh
docker build -t node-online-shop-root-less .
```

## Running the Docker Container

After building the image, I run the Docker container using the following command:

```sh
docker run -d -p 3000:5173 --name=online-shop node-online-shop-root-less:latest
```

## Docker Compose Setup

To simplify container management, I created a `docker-compose.yml` file. This allows me to define and run multi-container applications with ease.

Below is my `docker-compose.yml` file with comments explaining each section:

```yaml
version: '3'  # Define the Docker Compose version

services:
  node-online-shop-root-less:  # Service name for the application
    build:
      context: .  # Use the current directory as the build context
    container_name: node-online-shop-root-less  # Assign a specific container name
    user: appuser  # Run the container as a non-root user for security
    ports:
      - "3000:5173"  # Map port 5173 inside the container to port 3000 on the host
    restart: unless-stopped  # Ensure the container restarts unless manually stopped
    networks:
      - node-online-shop-root-less  # Attach the container to a custom network

networks:
  node-online-shop-root-less:  # Define a custom network for the application
```

To start the application using Docker Compose, run the following command:

```sh
docker-compose up -d
```

This will build and run the container in detached mode.

## Summary

In this phase of my learning journey, I successfully dockerized an online shop application using Docker and Docker Compose. I ensured best practices by selecting a secure base image, creating a `.dockerignore` file to keep the build clean, and defining a `docker-compose.yml` file for simplified container management. This project helped reinforce my understanding of containerization, security, and deployment strategies. Further refinements and optimizations will be added as I continue to learn and grow in my DevOps journey.
