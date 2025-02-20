# **Online Shopping Application – Hackathon Phase 1 Submission**

This repository contains a **React-based Online Shopping Application** that has been **Dockerized** for efficient deployment. The project includes a **Dockerfile** for building and serving the application using a **multi-stage Docker build**, as well as a **.dockerignore** file to optimize the container image. The first stage builds the application using **Node.js**, and the second stage serves static files using **Nginx**.

---

## **Table of Contents**

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Understanding the Dockerfile](#understanding-the-dockerfile)
  - [Stage 1: Build the Application](#stage-1-build-the-application)
  - [Stage 2: Serve the Application using Nginx](#stage-2-serve-the-application-using-nginx)
- [Understanding the .dockerignore File](#understanding-the-dockerignore-file)
- [Building the Docker Container](#building-the-docker-container)
- [Running the Docker Container](#running-the-docker-container)
- [Logging the Docker Container](#logging-the-docker-container)
- [Stopping the Container](#stopping-the-container)

---

## **Overview**

This **Online Shopping Application** is a **React-based web app** designed for e-commerce. It has been **containerized** using **Docker** to facilitate seamless deployment. The application is **built in a multi-stage Docker process**, ensuring that the final image remains lightweight by including only the necessary production files.

---

## **Prerequisites**

Before you proceed, ensure that you have the following installed in your system:

- **Docker** (latest version recommended)  
- **Node.js (v16 or later)** for local development (if needed)  
- **Nginx** (only required if testing locally outside of Docker)

---

## **Understanding the Dockerfile**

The **Dockerfile** is structured into two stages:

### **Stage 1: Build the Application**

In this stage, the **React application** is built using **Node.js 18**, ensuring that only production-ready files are included in the final image.

#### **Steps in this Stage:**

1. Uses **Node.js 18** as the base image.
2. Sets the working directory to **`/app`** inside the container.
3. Copies `package.json` and `package-lock.json` to install dependencies.
4. Installs project dependencies using `npm install`.
5. Copies the entire source code into the container.
6. Builds the application using `npm run build`, generating a **production-ready** output inside the `dist` directory.

#### **Dockerfile Configuration:**

```dockerfile
# Stage 1: Build the application
FROM node:18 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build
```

### **Stage 2: Serve the Application using Nginx**

In this stage, the application is served using **Nginx**, a lightweight and high-performance web server. This ensures efficient delivery of the built **React application** to users.

#### **Steps in this Stage:**

1. Uses **Nginx (Alpine Linux variant)** as the base image to keep the final image lightweight.
2. Sets the working directory to **Nginx’s default serving directory** (`/usr/share/nginx/html`).
3. Copies the **built application (`dist` folder)** from the first stage to Nginx’s serving directory.
4. Exposes **port 80**, allowing external access to the web server.
5. Runs **Nginx in the foreground** to keep the container active.

#### **Dockerfile Configuration:**

```dockerfile
# Stage 2: Serve the application using Nginx
FROM nginx:alpine AS production

# Set the working directory inside Nginx's serving directory
WORKDIR /usr/share/nginx/html

# Copy the built application from the builder stage to Nginx's serving directory
COPY --from=builder /app/dist .

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
```

### **Understanding the .dockerignore File**

The **`.dockerignore`** file ensures that unnecessary files and directories are **excluded from the Docker image**, making the build process **more efficient** by reducing the final image size and improving performance.

#### **Purpose of the .dockerignore File:**

- Prevents **unnecessary files** from being copied into the Docker image.
- Reduces **image size** by excluding unwanted files.
- Improves **build speed** by skipping files that are not needed.
- Enhances **security** by preventing sensitive files from being added.

#### **Files and Directories Ignored:**

```dockerignore
# Ignore dependencies folder (installed inside the container)
node_modules

# Ignore package manager logs
npm-debug.log

# Ignore environment variables and secrets
.env
.env.local
.env.production
.env.*.local

# Ignore build artifacts
dist
build

# Ignore Git-related files
.git
.gitignore

# Ignore macOS metadata files
.DS_Store

# Ignore editor/IDE-specific files
.vscode/
.idea/
*.swp
```

## **Building the Docker Container**

To build the Docker container, run the following command:

```bash
docker build -t online-shopping-app .
```

This command:

1. Uses the Dockerfile in the current directory (.).
2. Tags the image as online-shopping-app.

## **Running the Docker Container**

To run the container, execute:

```bash
docker run -d -p 80:80 --name online-shopping-container online-shopping-app:latest
```
This command:

1. -d runs the container in detached mode.
2. -p 80:80 maps port 80 (Nginx) inside the container to port 80 on your machine.
3. --name online-shopping-container gives the container a custom name.
4. online-shopping-app is the image name.

## **Logging the Docker Container**

To check container logs, run:

```bash
docker logs online-shopping-container
```

## **Stopping the Container**

To stop the container, run:

```bash
docker stop online-shopping-container
```

## **Removing the Container**

To remove the container, run:

```bash
docker rm online-shopping-container
```
## **Removing the Image**

To remove the image, run:

```bash
docker rmi online-shopping-app
```

------

Thank you for exploring this repository! 😁

Kartikey Narayan - TWS Batch 9 🚀