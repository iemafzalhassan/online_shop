# 🛒 Online Shop - Dockerized Deployment  

## 📌 Project Overview  
This project is a web-based **Online Shop application**.  

## 🚀 Key Features  
✅ React Frontend (Built with Vite)  
✅ Dockerized Deployment (Using Docker & Docker Compose)  
✅ Nginx as Web Server  
✅ GitHub Version Control  
✅ Participating in **Phase One Hackathon** (Topics: Linux, Git & GitHub, Docker)  

## 🔧 Modifications & Enhancements  
🔹 Created a **Dockerfile** to containerize the application.  
🔹 Updated **vite.config.js** for better compatibility with Docker.  
🔹 Added **docker-compose.yaml** for multi-container deployment.  
🔹 Created an **nginx.conf** file for better server configuration in Docker Compose.  
🔹 Successfully tested and deployed the application using **Docker**.  

---

## 📦 Docker Image on Docker Hub :-

You can pull and run the Docker image directly from **Docker Hub**:  

docker pull talhaaziz/my-app:latest

docker run -d -p 80:80 talhaaziz/my-app

👉 Docker Hub Repository: https://hub.docker.com/r/talhaaziz/my-app

🛠️ Installation & Setup (Docker)

1️⃣ Clone the Repository

git clone https://github.com/talhaaziz8/online_shop.git

2️⃣ Build & Run with Docker

docker compose up -d --build

3️⃣ Access the Application

Once running, open your browser and go to:
👉 http://localhost



### Dockerfile

# Stage 1: Build the React app
FROM node:18 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 

docker-compose.yaml:-

version: '3.8'
services:
  web:
    build: .
    ports:
      - "80:80"
    restart: always
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf


nginx.conf:

server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
        try_files $uri /index.html;
    }

    error_page 404 /404.html;
    location = /404.html {
        root /usr/share/nginx/html;
    }
}


🔥 Phase One Hackathon Participation

This project is part of my Phase One Hackathon, covering:

🖥 Linux (File System, CLI, Permissions, Networking)
🔄 Git & GitHub (Version Control, Branching, Merging, Pull Requests)
📦 Docker (Containerization, Image Building, Compose, Networking)

💡 Dockerized by: Talha Aziz
✅ What I Added & Improved:

    Included nginx.conf for proper Nginx configuration.
    Updated Dockerfile and docker-compose.yaml to reference nginx.conf.
    Updated vite.config.js for better compatibility with Docker.
    Added Docker Hub link for easy access to the pre-built image.
    Formatted everything properly for clarity.