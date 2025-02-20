# Online Shop - Hackathon Phase 1

## Introduction
This document outlines the steps taken to complete the **Online Shop Hackathon - Phase 1**. It covers setting up the project, running it locally, and containerizing the application using both **single-stage** and **multi-stage Docker builds**.

---

## 📌 Code Setup
### 1️⃣ Cloning the Repository
1. **Fork the repository** on GitHub.
2. **Clone the forked repository** locally:
   ```bash
   git clone <fork_url> tws-hackathon-1
   ```
   This will create a new directory named **tws-hackathon-1** and clone the repository inside it.

3. Navigate into the project directory:
   ```bash
   cd tws-hackathon-1
   ```

4. **Create and switch to a new branch:**
   ```bash
   git checkout -b tws-sayantan
   ```

### 2️⃣ Installing Dependencies
1. Install the required dependencies:
   ```bash
   npm install
   ```

2. Run the project locally:
   ```bash
   npm run dev
   ```
   The development server will start, and the application will be accessible at **localhost:5173**.

3. To stop the server, press:
   ```bash
   q + Enter
   ```
   > ⚠️ If using a Virtual Machine (VM), ensure that port **5173** is exposed in the security group.

---

## 📌 Containerization - Single Stage
To containerize the application, a **Dockerfile** is created.

### 1️⃣ Creating a Dockerfile
1. Create a new **Dockerfile** in the root directory:
   ```bash
   touch Dockerfile
   ```
2. Open the file for editing using Vim:
   ```bash
   vi Dockerfile
   ```
   Press `i` to enter **Insert Mode**, then add the following content:

   ```Dockerfile
    # Use an official Node.js image (version 23) based on Alpine Linux
    # Alpine is a lightweight Linux distribution, making the image smaller and more efficient.
    FROM node:23-alpine

    # Set the working directory inside the container to `/app`
    # All subsequent commands will be executed inside this directory.
    WORKDIR /app

    # Copy package.json and package-lock.json (if available) to the container

    COPY package*.json .

    # Install the project dependencies using npm
    
    RUN npm i

    # Copy all files from the project directory on the host to the `/app` directory in the container
    
    COPY . .

    # Expose port 5173 to allow traffic into the container
    # This is useful when running the app in a containerized environment and needs access from outside.
    EXPOSE 5173

    # Define the default command to run the application
    # This command starts the development server (`npm run dev`).
    CMD ["npm", "run", "dev"]
   ```
3. Save and exit Vim:
   ```bash
   :wq + Enter
   ```
### 2️⃣ Creating a .dockerignore File
To optimize the Docker image, create a **.dockerignore** file to exclude unnecessary files:

1. Create the file:
   ```bash
   touch .dockerignore
   ```

2. Open it in a text editor:
   ```bash
   vi .dockerignore
   ```

3. Add the following content:
   ```
   .git
   .vscode
   .gitignore
   .env
   config
   build
   node_modules
   docker-compose.yaml
   *.md
   ```

4. Save and exit Vim:
   ```bash
   :wq + Enter
   ```
### 3️⃣ Building and Running the Container
1. **Build the Docker image:**
   ```bash
   docker build -t online-shop:v1 .
   ```
2. **Verify the built image:**
   ```bash
   docker images
   ```
3. **Run the container:**
   ```bash
   docker run --name online-shop-app -p 3000:5173 -d online-shop:v1
   ```
   This will create a container named **online-shop-app** and map **port 3000** of the host system to **port 5173** of the container.

4. **Verify the application is running** by navigating to **localhost:3000** in the browser.

5. **Stop the container:**
   ```bash
   docker container stop online-shop-app
   ```

---

## 📌 Containerization - Multi-Stage Build
To **optimize the final image size** and **enhance security**, a **multi-stage build** is implemented.

### 1️⃣ Updating the Dockerfile
Modify the existing **Dockerfile** to use a multi-stage build:

```Dockerfile
# ===========================
# Stage 1: Build Stage
# ===========================

# Use an official Node.js image (version 23) based on Alpine Linux for minimal size and efficiency

FROM node:23-alpine AS builder

# Set the working directory inside the container to `/app`
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the container
# This ensures dependencies are installed correctly and helps leverage Docker's caching mechanism
COPY package*.json .

# Install project dependencies using npm
RUN npm i

# Copy all source code files from the host machine to the `/app` directory inside the container
COPY . .

# Run the build process for the application
# This will generate the production-ready static files inside the `dist/` directory
RUN npm run build

# ===========================
# Stage 2: Production Stage
# ===========================

# Use an official lightweight Nginx image for serving static files efficiently
FROM nginx:stable-alpine3.20-slim

# Copy the built application files from the first stage (builder) to the Nginx web root directory
COPY --from=builder /app/dist /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80
```
### 2️⃣ Building and Running the Optimized Container

1. **Build the multi-stage image:**
   ```bash
   docker build -t online-shop:v2 .
   ```
2. **Compare the image sizes:**
   ```bash
   docker images --filter "reference=online-shop"
   ```
   **Expected Output:**
   ```bash
   REPOSITORY    TAG       IMAGE ID       CREATED       SIZE  
   online-shop   v2        ae13bb6e47e3   4 hours ago   12.7MB  
   online-shop   v1        6bf6bb8a086d   4 hours ago   294MB  
   ```
   The **multi-stage build (v2) significantly reduces image size**, improving deployment efficiency.

3. **Run the optimized container:**
   ```bash
   docker run --name online-shop-app -p 3000:80 -d online-shop:v2
   ```
   This maps **port 3000** of the host to **port 80** of the container.

4. **Verify the application is running** by navigating to **localhost:3000**.

---

## 📌 Conclusion
By following these steps, the application was successfully **set up, containerized, and optimized** using **multi-stage Docker builds**. The optimized image is significantly smaller, reducing security risks and improving performance. 🚀

This concludes my submission for Hackathon Phase 1! 🎯