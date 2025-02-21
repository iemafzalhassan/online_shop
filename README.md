# 🛍️ From Code to Cloud: Deploying a React E-Commerce App with Docker ⚡

---

## 📢 Introduction  
Welcome to **Ecommerce Online Shop**, a modern React.js e-commerce application that is containerized using **Docker** for seamless deployment. This project demonstrates efficient development and deployment using cutting-edge tools like **Vite, React, and Docker**.

---

## 🚀 Key Features  
- ⚡ **Blazing fast development** with Vite  
- 🧱 **Component-based architecture** using React  
- 🐳 **Dockerized** for seamless deployment  
- 🔥 **Hot Module Replacement (HMR)** for an enhanced development experience  
- 📦 **Optimized production build**  
- 💅 **Styled beautifully** using Sass  

---

## 📂 Project Structure  
```
Ecommerce_Online_Shop/
├── node_modules/              # Dependencies
├── public/                    # Static assets
├── src/                       # React components & pages
│   ├── components/            # Reusable components
│   ├── pages/                 # Application pages
│   ├── App.jsx                # Root component
│   └── main.jsx               # Entry point
├── Dockerfile                 # Docker configuration
├── Dockerfile-multi-stage     # Optimized multi-stage Dockerfile
├── docker-compose.yml         # Docker Compose file
├── package.json               # Project metadata & dependencies
├── vite.config.js             # Vite configuration
└── README.md                  # Documentation
```

---

## ⚙️ Running the Project  

### ✅ Locally (Without Docker):
```sh
git clone https://github.com/mukeshchaudhary14/Devops-Hackathon-.git  
cd Devops-Hackathon  
npm install  
npm run dev  
```
Open the app in your browser at **http://localhost:5173** or AWS Link.

### ✅ Using Docker:
```sh
docker build -t online-shop:v1 .  
docker run -p 3000:5173 online-shop:v1  
```
Access the app at **http://localhost:5173** or AWS Link.

### ✅ Using Docker Compose:
```sh
docker-compose up  
```
Open it at **http://localhost:3000** or AWS Link.

---

## 📋 Dockerfile Explanation  

### **Basic Dockerfile**
```dockerfile
# Pull base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy app source code
COPY . .

# Install dependencies
RUN npm install

# Expose the port used by Vite
EXPOSE 3000

# Run the development server
CMD ["npm", "run", "dev"]
```
Run the following command to build and run the image:
```sh
docker build -t online-shop:v1 .
docker run -p 3000:5173 online-shop:v1
```

### **Docker Multi-Stage Build**
```dockerfile
# Stage 1: Install dependencies using Alpine for minimal size
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json for efficient caching
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of the app source code
COPY . .

# Stage 2: Use smallest distroless image for runtime
FROM gcr.io/distroless/nodejs20

# Set working directory
WORKDIR /app

# Copy built app and node_modules from builder
COPY --from=builder /app /app

# Expose the port used by Vite
EXPOSE 3000

# Run the app
CMD ["npm", "run", "dev"]
```
### Benefits of Multi-Stage Build:
- 📉 **Reduced image size** (~386MB from ~426MB)
- 🔐 **Minimal attack surface** using distroless image

---

## 📋 Docker Compose File  
```yaml
# Use Docker Compose version 3.8
version: '3.8'

# Define services (containers) to run
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:5173"
    environment:
      - NODE_ENV=production
    volumes:
      - .:/app
      - /app/node_modules
    command: ["npm", "run", "dev"]
```
Run using Docker Compose:
```sh
docker-compose up
```

---

## 🎬 Live Demo & Video Walkthrough  
Check out the live demo and a detailed video explaining the setup, optimizations, and deployment process.

🔗 **Demo Video 1**  
🔗 **Demo Video 2**  
🔗 **Demo Video 3**  

---

## 📤 GitHub Repository  
📂 **[Devops-Hackathon](https://github.com/mukeshchaudhary14/Devops-Hackathon-)**

Feel free to explore, fork, and contribute! 🌟

---

## 🙌 Thank You!  
This was a fun project to work on, and I hope it inspires others to explore **Vite, React, and Docker** together.

Would love to hear your feedback! 💬

📧 **Get in Touch:**  
- **Full Name:** Mukesh Chaudhary  
- **Email:** mukesh.chaudhary.1716@gmail.com  
- **GitHub Repo:** [Devops-Hackathon](https://github.com/mukeshchaudhary14/Devops-Hackathon-)  
- **Demo Video:** [Demo Video 1](#)  

✅ **Key Highlights:**  
- ⚡ **Super-fast build** with Vite  
- 🐳 **Dockerized** for scalable deployment  
- 🏗️ **Optimized Docker image** with multi-stage builds (reduced size by ~40MB)  
- 💅 **Styled beautifully** using Sass  
- 🏗️ **Docker Compose** for smooth orchestration  

💡 **Would love your thoughts!**  
✅ Drop a like ❤️  
✅ Share your feedback 💬  
✅ Fork & contribute 🚀  

#ReactJS #Vite #Docker #DevOps #WebDevelopment #Ecommerce #FullStack #OpenSource

