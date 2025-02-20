# Online Shop 🛍️ Hackathon Phase 1 Submission

Welcome to the Online Shop project! This repository showcases a fully functional e-commerce application built using foundational DevOps skills with a focus on Linux, Git, and Docker.

# Overview

Hello Everyone 👋 I am student of Batch 9 of Junoon batch and I have successfully completed Phase 1 . In Phase 1 Hackathon i learned about Linux , Git ,Networking and Docker.

#TrainWithShubham is organize the Hackathon for a Batch 9 Student . Main objective is apply to own knowledge and dockerize on the project .

# 🚀 Let's Quick Start

## First Local Without Docker

### Clone the Repository

```bash
mkdir Phase_1-DevOps
 git clone https://github.com/shivkingl/online_shop.git
 cd online_shop
```

### Install Dependencies

```bash
 npm install
```

### Start Server

```bash
npm run dev
```

This server is running on http://localhost:5173

# Using Docker

### Create New Branch

```bash
git checkout -b feature/docker-creation
```
then do some changes

# Before Selecting Base Image
Before chooseing the base image for Dockerfile :-
- I select the offical Node.js image for Dockerfile like node:latest 
- Then i select the Alpine Varient for dockerfile like node:lts-alpine because it reduce the image size and maintain stability.
- I also verified this selected image had no vulnerablities .


## Docker Implementation

The application has been containerized using a multi-stage Docker build process to optimize for both development and production environments.

### Dockerfile Structure

```Dockerfile
# Build stage-1
FROM node:latest AS build-stage #node:latest is used for base image
WORKDIR /app           #Create app directory
COPY package*.json ./   # A wildcard is used to ensure all package.json are copied
RUN npm install     # Install app or website  dependencies
COPY . .   # Copy files source to destination

# Production stage-2
FROM node:lts-alpine AS production  #node:lts-alpine is the base image for reduce size
WORKDIR /app/phase1_hackathon  # Again Create app directory
COPY --from=build-stage /app /app/phase1_hackathon  # Copy the files from the build-stage to the production stage
EXPOSE 5173    # Expose the port for running application
CMD [ "npm","run","dev","--","--host"]  # Run the application in according development mode

```
**[!NOTE]**  
**What is Dockerfile** :- Dockerfile is simple text file with instructions to build an image 

# Build the Docker Image 

```bash
docker build -t phase1-hackathon .
```
-t : Tag the image name
# Running the Docker Container

```bash
docker run -d -p 3000:5173 phase1-hackathon:latest
```
this docker container runing on http://localhost:3000

-d : Detached Mode 

-p : Port 

# Create dockerignore
```bash
vim .dockerignore 
```
## Add this files in .dockerignore
```bash
.dockerignore
 package-lock.json
 Dockerfile

```
