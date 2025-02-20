# 🛍️ Online Shop - Docker | Vite | React 

Welcome to the **Online Shop** project, this guide will help you set up and run the project. 🚀

---

## 📋 Steps to Set Up and Run the Project

## 👇FOR AWS USERS and LOCAL USERS

### 0️⃣ Logged in on AWS Console
- Logged into the AWS Console and started an instance with **Ubuntu**.
- Saved the key pair for secure access.

### 1️⃣ Allow port
- Allow 3000 port which will be used in this project
- click on instance and navigate to security group then edit inbound rules then add rule then add 3000 port then set it to all ipv4 then save

### 2️⃣ Connected with Local Machine
- Ensured the key is not publicly viewable using:
  ```bash
  chmod 400 (downloaded key name)
  ```
- Connected the instance with the local machine using **SSH**.

### 3️⃣ System Update
- Updated the system with:
  ```bash
  sudo apt update
  ```

### 4️⃣ Forked the Hackathon Repository
- Forked the original Hackathon repository to my GitHub account for independent work.

### 5️⃣ Created a Directory for the Project
- Created a directory named `hackathon`:
  ```bash
  mkdir hackathon
  ```
- Navigated into this directory:
  ```bash
  cd hackathon
  ```

### 6️⃣ Installed Docker 🐳
- Installed Docker using:
  ```bash
  sudo apt-get install docker.io
  ```

### 7️⃣ Verified Docker Installation ✅
- Checked if Docker is running:
  ```bash
  sudo systemctl status docker
  ```

### 8️⃣ Added Current User to Docker Group 👤
- Added current user to the Docker group:
  ```bash
  sudo usermod -aG docker $USER
  ```

### 9️⃣ Refreshed User Groups 🔄
- Applied changes to user groups:
  ```bash
  newgrp docker
  ```

### 🔟 Cloned the Hackathon Repository Locally 🛠️
- Cloned the forked repository to my instance generated a personal access token (PAT) from Settings > Developer Settings > PAT > Tokens for authentication:
  ```bash
  git clone https://username:PAT@github.com//online_shop.git
  ```

### 🔢 Reviewed Source Code and Created a Dockerfile 📂
- Analyzed the source code and created a `Dockerfile` using `vim`:
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

  # Here, it starts a development server using npm's "start" script
  CMD ["npm", "run", "start"]
  ```

### 🔢 Built the Docker Image 🏗️
- Built a Docker image of the project:
  ```bash
  docker build -t on-shop .
  ```

### 🔢 Ran the Application in a Container 🖥️
- Ran a container from the built image, mapping it to port `3000` on the host machine:
  ```bash
  docker run -p 3000:3000 on-shop
  ```

  ![image](https://github.com/user-attachments/assets/8ac81875-b794-4d5f-bb1a-49febeff7442)

- The application is accessible at: `http://IP:3000/`.

### 🔢 Multi-stage Docker file 🏗
- To reduce size of image
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

### 🔢 Docker compose file ✅
- Created a new branch named `final-phase1`:
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
### 🔢 Run Docker compose file ✅
```bash
docker-compose up
```

### OUTPUT 

![Screenshot 2025-02-20 202007](https://github.com/user-attachments/assets/66a32e96-0c5b-4860-969a-29268a40a2e6)


### 🔢 Created a New Branch 🌿
- Created a new branch named `final-phase1`:
  ```bash
  git checkout -b final-phase1
  ```

### 🔢 Pushed Changes to GitHub 📤 
- Added, committed, and pushed changes to GitHub:
   ```bash
   git add .
   git commit -m "Added Dockerfile and changes in vite.config.js"
   git push origin final-phase1
   ```

---

## ✨ Key Changes Made

### Modified `vite.config.js`
Here’s how I updated `vite.config.js`:

```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: './',
    css: {
        devSourcemap: false,
    },
    server: {
        port: 3000,
        host: true,
    },
});
```
- Replaced dev to start in package.json
  
---

## 🎉 Congratulations!
-You’ve successfully set up and run the **Online Shop** project. 

-Here is the video : https://photos.app.goo.gl/8pU75d7oi6wkym9y9

-Feel free to explore and contribute further! 😊

--- 
