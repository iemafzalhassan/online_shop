# Online Shop - Multi-Stage Docker Build

This project is an online shop that utilizes a multi-stage Docker build. By using multi-stage builds, we reduce image size and improve security.

## Features
- Uses multi-stage builds to optimize image size.
- Runs on Distroless Node.js for enhanced security and performance.

## Setting Up the Development Environment
Follow these steps to run the application on a local machine:

### Step 1: Clone the Repository
```
git clone <Repo Link>
```

### Step 2: Update the Package List and Install Node.js
```
sudo apt-get update  
sudo apt-get install nodejs 
```

### Step 3: Install Dependencies
```
npm install  
```

### Step 4: Start the Development Server
```
npm run dev 
```

### Step 5: Open the Application in Your Browser
Visit:
```
http://localhost:3000
```
The website will then be running.

## Creating a Dockerfile (Multi-Stage Build)

### Stage 1: Builder
Create a `Dockerfile` and add the following:

```
# Use Node.js 18 as the base image
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Build the application
RUN npm run build
```

### Stage 2: Production (Distroless Image)

```
# Use Distroless Node.js as the base image
FROM gcr.io/distroless/nodejs:18

# Set working directory
WORKDIR /app

# Copy built application from builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Expose port 3000
EXPOSE 3000

# Run the application
CMD ["node_modules/.bin/serve", "-s", "dist", "-l", "3000"]
```

**Note:** Ensure that `serve` is added as a dependency in `package.json` for this setup to work correctly.

This setup ensures an optimized and secure Docker image for deploying the online shop efficiently using Distroless Node.js.
 
