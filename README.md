# Online Shop 🛍️ for Hackathon Phase 1


## Steps to Set Up and Run the Project

### 1. Logged in on AWS console
Logged in and started an instance with ubuntu and saved the key pair


### 2. Connected with local
Using chmod 400 I ensured my key is not publicly viewable then I connected instance with local using SSH


### 3. System update
updated system using command
```bash
sudo apt update
```

### 4. Forked the Hackathon Repository
Started by forking the original Hackathon repository to GitHub account. This allowed me to work on my own copy of the project.


### 5. Created a Directory for the Project
Createed a directory named `hackathon` by running:
```bash
mkdir hackathon
```
Navigating into this directory:
```bash
cd hackathon
```

### 6. Installing Docker
Installing Docker on system using the following command:
```bash
sudo apt-get install docker.io
```

### 7. Verifying Docker Installation
Checked if Docker is running by executing:
```bash
sudo systemctl status docker
```

### 8. Added Current User to Docker Group
```bash
sudo usermod -aG docker $USER
```

### 9. Refresh User Groups
Applied the changes to user group:
```bash
newgrp docker
```

### 10. Cloned the Hackathon Repository Locally
Cloned the forked repository to my instance generated a personal access token (PAT) from Settings > Developer Settings > PAT > Tokens for authentication:
```bash
git clone https://surya-editct:PAT@github.com/surya-edict/online_shop.git
```

### 11. Analyzing Source Code and Created a Dockerfile
After reviewing and analyzing the source code, created a `Dockerfile` to containerize the application. Using `vim`:
```bash
vim Dockerfile
```

```bash
# Alpine is chosen for its lightweight nature, which helps reduce the image size
FROM node:18-alpine

# Setting the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies specified in package.json
RUN npm install

# Copy the rest of the application code into the working directory
COPY . .

# Exposing port 3000 to allow external access to the application
EXPOSE 3000

# Here, it starts a development server using npm's "dev" script
CMD ["npm", "run", "start"]
```

### 12. Build the Docker Image
Built a Docker image of the project using the following command:
```bash
docker build -t on-shop .
```

### 13. Ran the Application in a Container
Ran a container from the built image and map it to port `3000` on your host machine:
```bash
docker run -p 3000:3000 on-shop
```
![Screenshot 2025-02-20 201258](https://github.com/user-attachments/assets/62dc5f0f-5cdb-434d-b6e7-a7b1fd5074b3)

The application is accessible at `http://IP:3000/`.

### 13. Multi-stage Docker file 
```bash
# Stage 1: Build Stage
FROM node:18-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the working directory
COPY . .

# Build the application
RUN npm run build



# Stage 2: Production Stage
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=builder /app /app

# Expose port 3000 for external access
EXPOSE 3000

# Start the application in production mode
CMD ["npm", "run", "start"]
```

### 13. Docker compose file 
```bash
vim docker-compose.yml
```
```bash
version: "3.8"

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/app # Mount the current directory to /app in the container for development
      - /app/node_modules # Prevent overwriting node_modules in the container
    environment:
      NODE_ENV: development # Set environment variable
    command: npm run start
```

OUTPUT:

![image](https://github.com/user-attachments/assets/ca9340d9-59c1-49f5-a5bb-ee66a96c2d0d)

### 14. Made new branch :
Made new branch final-phase1 using 
```bash
git checkout -b final-phase1
```

### 15. Pushing to github repo :
By adding, commiting and pushing
```bash
git add .
```
```bash
git commit -m "added dockerfile and changes in vite.config.js "
```
```bash
git push origin final-phase1
```

---

## Key changes I made

- Modified vite.config.js 
```bash
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: './',
    css: {
      devSourcemap: false
    },
    server: {
      port: 3000,
      host: true
    }
});
```

- Replaced dev to start in package.json


