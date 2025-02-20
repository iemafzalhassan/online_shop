      🚀Online Shop – Hackathon Phase 1 Submission 🛒
Overview 🚀🚀🚀
This project is an Online Shop application developed as part of a hackathon. The solution leverages Git & GitHub for version control, Linux for environment setup and scripting, and Docker for containerization and deployment. 
The application is built using Node.js and optimized with a distroless Docker image for a lightweight and secure deployment. 🚀🚀🚀

🔧 Task Descriptions & Implementations

✅ Repository Management

Utilized Git for version control.

Created branches for different features.

Used GitHub Actions for CI/CD.

 ✅Linux Commands & Scripts
Used Linux commands to:

Navigate the file system (cd, ls).

Create and manage directories (mkdir, rm).

Install dependencies (npm install).

Run the application (npm run build, npm run start).

 ✅Docker Integration
Implemented a multi-stage Docker build to optimize the final image size.

Stage 1: Used a node:18 image to build the application.

Stage 2: Used a distroless Node.js image (gcr.io/distroless/nodejs18-debian11) for the final deployment.

Exposed port 3000 for the application to run.

Used Docker commands to:

create network (docker network create rohit) 

Build the image (docker build -t online-shop .).

Run the container  ( docker run -d -p 3000:3000 --name online-app --network rohit    online-shop
).

Inspect the network (docker inspect rohit).

🏗️ Dockerfile (Multi-Stage Build)

# STAGE 1: Build the application
FROM node:18 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# STAGE 2: Use distroless image for optimized size and security
FROM gcr.io/distroless/nodejs18-debian11

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["node_modules/vite/bin/vite.js", "--host", "0.0.0.0", "--port", "3000"]

🔍 Docker Inspection Details

Container Name: online-app
Network Name: rohit
IPv4 Address: 172.18.0.2/16
Gateway: 172.18.0.1


🚀 How to Run

1 fork the project

2 Clone the repository 🛠️
git clone https://github.com/Rohit101111/online_shop.git
cd online_shop

3 create dockerfile
vim dockerfile

#STAGE1
# Use Node.js image run as a builder for distroless image

FROM node:18 as builder

# create working directory

WORKDIR /app

# Copy pakages file for the install pakages to un application

COPY package*.json ./

# Run cammand for the install pakages for run file

RUN npm install

# Copy the remaning file for excuite project

COPY . .

# Camands Build the project

RUN npm run build

#STAGE 2

# Use distroless image of nodejs for less size of image

FROM gcr.io/distroless/nodejs18-debian11

# create working directory for stage 2

WORKDIR /app

# Copy files from  stage 1 to stage 2

COPY --from=builder /app /app

#Expose port 3000 beacuse that need to deploy code

EXPOSE 3000

# Cammand Run the application

CMD ["node_modules/vite/bin/vite.js", "--host", "0.0.0.0", "--port", "3000"]

4 Build the Docker image 🐳
docker build -t online-shop .

5 CREATE PERSONAL NETWORK
docker network create rohit

6 Run the container and attach network🚀
docker run -d -p 3000:3000 --name online-app --network rohit online-shop

7 Access the application 🌍
http://34.244.28.245:3000/

8 Docker Network Inspection 🔍
docker inspect rohit


Thank you for reviewing my project! 🙌 🚀🚀🚀





