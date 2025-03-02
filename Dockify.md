# Online Shop - Hackathon Phase 1 Submission

## Overview

This repository contains my submission for the **Online Shop** Hackathon Phase 1. The project is an e-commerce application demonstrating DevOps principles, focusing on:

- **Git & GitHub** - Version control, collaboration, and workflow management.
- **Linux** - System administration, command-line operations, and scripting.
- **Docker** - Containerization and deployment readiness.

## Tasks Completed

### 1. Updated `vite.config.js` to Use Port 3000

I modified the `vite.config.js` file to ensure the development server runs on port **3000**, making it more consistent for testing and containerization.

```
export default defineConfig({
  plugins: [react()],
  base: './',
  css: {
    devSourcemap: false
  },
  server: {
    host: '0.0.0.0',  // Allow access from outside the container
    port: 3000        // Set port to 3000
  }
});

```

WORKDIR /app

### 2. Created a Dockerfile for Containerization(Docker image size: 234MB)

To containerize the application, I created a **Dockerfile** with the following setup:

#### **Dockerfile:**

```dockerfile

# stage 1: where i pull node's smallest image from docker registry
FROM node:20-alpine AS builder

#create a directory inside the contianer
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./

#it use for faster dependencies installation
RUN npm ci

# Copy source code to container
COPY . .
#stage 2:  Runner stage - Create a lightweight production-ready containe
FROM node:20-alpine AS runner

#create a directory inside the contianer
WORKDIR /app/online_shop

# Install 'serve' for serving the built app

# Copy only the built files from builder stage
COPY --from=builder /app /app/online_shop

# Expose the port
EXPOSE 3000

# Serve the built React app
CMD ["npm","run","dev"]
```

### 3. Built Docker Image & Ran Container

After creating the **Dockerfile**, I built the image and run a container with the following commands:

#### **Building the Docker Image:**

```sh
docker build -t node_multistage:mini .
```

#### **Running the Container:**

```sh
docker run -d -p 3000:3000 --name online-shop-container node_multistage:mini 
```

### 4. Pushed Docker Image to Docker Hub

I pushed the built image to **Docker Hub** to make it publicly accessible.

#### **Docker Hub Repository URL:**

[👉 Click Here to View Image on Docker Hub](https://hub.docker.com/u/nenisrudani)

#### **Pushing the Image to Docker Hub:**

```sh
docker tag  nenisrudani/node_multistage:mini 

docker push nenisrudani/node_multistage:mini 

```

## Submission Details

- **Branch for Evaluation:** `react-dockerized`
- **Docker Hub Image URL:** https://hub.docker.com/repository/docker/nenisrudani/node_multistage/general
- **Demo Video:** https://youtu.be/cCt0XT5cS5A

## Key Enhancements & Learnings

- Configured **Vite** to run on port **3000** for consistency.
- Containerized the application using **Docker**.
- Published the image to **Docker Hub** for easy deployment.
- Gained practical experience in **DevOps** concepts.

## Conclusion

This submission demonstrates my ability to work with **GitHub, Linux, and Docker**. The project is now prepared for containerized deployment and further enhancements in future phases.

---

🚀 **Thank you for reviewing my submission!** 🚀


