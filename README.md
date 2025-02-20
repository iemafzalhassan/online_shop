# Online Shop – Hackathon Phase 1 Submission

Welcome to the **Online Shop** project! This is a modern e-commerce platform built using **Vite, Node.js, and Docker**.

## 📜 Features
- 🛒 E-commerce platform
- ⚡ Built with **Vite** for fast development
- 🐳 **Dockerized** using a **Distroless image** for security & performance
- 📡 Exposed on **port 3000** for deploy on server
- 🔄 Supports **Volumes & Networks** for easy management 

---

## 🚀 Getting Started

### **1️⃣ Prerequisites**
Ensure you have the following installed:
- **Docker** (for containerized setup)
- **Node.js v16+** (if running locally)
- **Git** (for cloning the repository)

---

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/VedTambe/online_shop.git
ls
cd online_shop
```

---

## 🛠 Creating the Dockerfile for our project

Before building the Docker image, create a `Dockerfile` in the root of the project with the following content:

``` #STAGE 1

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

```
---

## 🐳 build an image & Running with Docker

### **3️⃣ Build and Run the Container**

#### **Step 1: Build the Docker Image**
```sh
docker build -t online_shop:latest
```

#### **Step 2: List All Docker Images**
```sh
docker images 
```

#### **Step 3: Scan the Image Using Docker Scout**
```sh
docker scout quickview online_shop
```

#### **Step 4: Create a Docker Network**
```sh
docker network create ved-net
```

#### **Step 5: Run the Container**
```sh
docker run -d \  --name online_shop \ -p 3000:3000 \ --network ved-net \ -v <path of your volume>:/app/db \  online_shop:latest
```

#### **Step 6: Check Running Containers**
```sh
docker ps
```

### **4️⃣ Verify if the Container is Running**
```sh
docker ps
```
You should see your **online_shop** container running on **port 3000**.

### **5️⃣ Access the Application**
iOpen your browser and visit:
👉 **http://localhost:3000**

---
## 🤝 for submit 

1. Fork the repo & clone it.
2. Create a feature branch:
   ```sh
   git checkout -b feature/your-feature
   ```
3. Commit changes using Conventional Commits:
   ```sh
   git commit -m "feat: add user authentication"
   ```
4. Push to your branch:
   ```sh
   git push origin feature/your-feature
   ```
5. Create a Pull Request (PR) 🚀

---
#thank you .


