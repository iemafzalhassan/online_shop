# 🎁 Online Shop for Hackathon Phase 1 - Submission  

Welcome to the **Online Shop** project! This is a modern **e-commerce platform** built using **Vite, Node.js, and Docker**.

---

## 🚀 Features  
- 🛒 **E-commerce Platform** – A fully functional online shop app  
- ⚡ **Built with Vite** – Ensures fast development and hot reloading  
- 🐳 **Dockerized with a Lightweight Image** – Uses **Distroless** for security & performance  
- 📱 **Exposed on Port 3000** – Ready for deployment on any server  

---

## 🔧 Prerequisites  
Ensure you have the following installed before running the project:  
- **Docker** (for containerized setup)  
- **Node.js v16+** (if running locally)  
- **Git** (for cloning the repository)  

---

## 📂 Clone the Repository  
Run the following commands:  

```bash
git clone https://github.com/vp3011/online_shop.git
ls
cd online_shop
```

---

## 🛠 Creating the `Dockerfile`  
Before building the Docker image, create a `Dockerfile` in the root directory with the following content:  

```dockerfile
# Stage 1: Build using Node.js with Alpine
FROM node:18-alpine as builder

# Set working directory
WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the project
RUN npm run build

# Stage 2: Use a lightweight Distroless image for the final image
FROM gcr.io/distroless/nodejs18

# Set working directory
WORKDIR /app

# Copy only necessary files from builder stage
COPY --from=builder /app /app

# Expose port 3000 for the app
EXPOSE 3000

# Start the application
CMD ["node_modules/.bin/vite", "--host", "0.0.0.0", "--port", "3000"]
```

---

## 🛠 Creating `.dockerignore`  
To prevent unnecessary files from being copied into the image, add the following to `.dockerignore`:  

```
node_modules
.git
.env
```

---

## 🐳 Build and Run with Docker  

### **3️⃣ Build and Run the Container**  
#### **Step 1: Build the Docker Image**  
```bash
docker build -t online-shop:latest .
```

#### **Step 2: List All Docker Images**  
```bash
docker images
```

#### **Step 3: Run the Container**  
```bash
docker run -d -p 3000:3000 --name online-shop-app online-shop:latest
```

#### **Step 4: Check Running Containers**  
```bash
docker ps
```

---

## **4️⃣ Verify if the Container is Running**  
Run the following command to check if the container is running properly:  
```bash
docker ps
```

If the container is **not running**, check the logs using:  
```bash
docker logs online-shop-app
```


## 🤝 For Submission  
### Follow these steps to submit your contributions:  
1. **Fork the repository** & clone it:  
   ```bash
   git clone https://github.com/vp3011/online_shop.git
   ```  
2. **Create a feature branch:**  
   ```bash
   git checkout -b phase-1
   ```  
3. **Commit changes using Conventional Commits:**  
   ```bash
   git commit -m "feat: add user authentication"
   ```  
4. **Push to your branch:**  
   ```bash
   git push origin phase-1
   ```  
5. **Create a Pull Request (PR) 🚀**  

--- 

