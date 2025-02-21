## Online Shop

## Overview 
A multi-stage Docker build was used to containerize this React-based online shop application. The configuration ensures a lightweight final image that is ready for production deployment.

## Features

- **Multi-stage Docker build** to optimize image size
- **Alpine-based Node.js** for efficiency
- **Build process included** in a separate stage
- **Exposes port 3000** for the application

## Prerequisites

Ensure you have the following installed:

- Docker
- Node.js (v16 or higher)
- npm or yarn
- Git
## Getting Started

### Clone the Repository
Start by cloning the forked repository from GitHub:

```
git clone https://github.com/AparnaPatode/online_shop.git
```

### Install Dependencies

```
npm install
```

### Build the App

```
npm run build
```


### Create a Multi-Stage Dockerfile

#### Stage 1: Build the Application

    # Base Image
    FROM node:18-alpine AS builder

- Uses node:18-alpine, a lightweight version of Node.js based on Alpine Linux, which reduces the image size.
- Names this stage as builder (used later in COPY --from=builder).

   
 ```
 # Working directory
 WORKDIR /app
 ```

- Sets /app as the working directory inside the container.
- All subsequent commands will execute from this directory.

```
COPY package.json package-lock.json ./
```

- Copies package.json and package-lock.json to the container.
- This ensures that only necessary files are copied first, optimizing the layer caching.

```
RUN npm install
```

- Installs project dependencies listed in package.json.

```
# Copy source code to container
COPY . . 
```

- Copies the entire project source code to the container.
- This includes all React components, assets, and configurations.

```
# Run the build command
RUN npm run build
```

- Runs npm run build, which compiles the React app into a static bundle inside the /app/dist directory.
- This step generates optimized, minified production-ready assets.

#### Stage 2: Serve the Application

```
# STAGE-2 (Where we will have just code and the code dependencies without linux distribution)
FROM node:18-alpine
```

- Uses node:18-alpine again to keep the runtime environment lightweight.

```
# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
```

- Creates a user group (appgroup) and a new user (appuser).
- This improves security by preventing the container from running as root.


```
WORKDIR /app
```

- Sets /app as the working directory.

```
# Copy the dependencies
COPY --from=builder /app/dist /app/dist
```

- Copies only the dist folder from the previous build stage (builder).
- This ensures that the final image does not contain unnecessary files like node_modules, source code, or build tools.


```
# Change ownership of the working directory
RUN chown -R appuser:appgroup /app
```

- Ensures that the /app directory is owned by appuser.

```
# Switch to the non-root user
USER appuser
```

- Runs the application as appuser, improving security.

```
RUN npm install -g serve
```
- Installs serve, a lightweight Node.js static file server.
- This will serve the React app instead of using a full web server like Nginx.

```
# Expose port 3000
EXPOSE 3000
```

- Declares that the container will use port 3000.
- This does not publish the port but serves as metadata for when the container runs.

```
# Command to start the server
CMD ["serve", "-s", "dist", "-l", "3000"]
```

- Runs the serve command to host the static React build.
- The flags:
    - -s dist: Serve the files from the /app/dist directory.
    - -l 3000: Listen on port 3000.


## How to Use

### 1. Build the Image

```
docker build -t online-shop .
```

### 2. Run the Container

```
docker run -d -p 3000:3000 online-shop
```

## Access the App

```
curl http://localhost:3000
```
or for an EC2 instance:

```
http://your-ec2-public-ip:3000

```

## Pushing changes to Github

### Configure Git Remote

```
git remote -v

```
#### Set the remote URL

```
sudo git remote set-url origin https://<your-PAT-token>@github.com/AparnaPatode/online_shop.git
```

#### Create a new branch for your changes

```
git checkout -b feature/docker

```

#### Add and Commit Changes

```
git add .
git commit -m "feat: added single and multistage docker file"
```

#### Push the branch 

```
git push origin feature/devops
```

## Create a Pull Request for review

#### 1. Go to your GitHub Repository
#### 2. Click on Compare & pull request
#### 3. Add a tile and description
#### 4. Submit the pull request 

## NOTE:
- Scan your Docker images for vulnerabilities using Docker Hub, Trivy, or AWS ECR.
- This multi-stage build reduces the final image size by excluding unnecessary dependencies.
- Running as a non-root user enhances security.
- Alpine Linux is used to keep the image lightweight.


## The online shop frontend is now fully Dockerized and has been successfully deployed on EC2







