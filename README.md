

# 🛍️ Online Shop – Vite + React + Node + Docker 🐳
This project is a **React.js** application bundled with **Vite** and containerized using **Docker**. It showcases an online shop built with modern web technologies, optimized for development and deployment.

---

## 🚀 Features

- ⚡️ Fast development build with **Vite**
- 🧱 Component-based architecture using **React**
- 🐳 **Dockerized** for easy deployment
- 🔥 Hot Module Replacement (HMR) for efficient development
- 📦 Optimized production build
- 💅 Styling with **Sass**

---

## 📂 Project Structure

```
online-shop/
├── node_modules/              # Installed dependencies
├── public/                    # Public assets
├── src/                       # Application source code
│   ├── components/            # Reusable React components
│   ├── pages/                 # Application pages
│   ├── App.jsx                # Main App component
│   └── main.jsx               # App entry point
├── Dockerfile                 # Docker configuration
├── Dockerfile-multi-stage     # Optimized multi-stage Dockerfile
├── docker-compose.yml         # Docker Compose configuration
├── package.json               # Project metadata & dependencies
├── vite.config.js             # Vite configuration
├── .dockerignore              # Docker ignore file
└── README.md                  # Project documentation
```

---

## ⚙️ Setup Instructions

### 1️⃣ **Clone the Repository**

```bash
git clone https://github.com/amrita122/online_shop.git
cd online_Shop
```

---

### 2️⃣ **Run Locally (Without Docker)**

1. **Install dependencies:**

   ```bash
   npm install
   ```

2. **Run the development server:**

   ```bash
   npm run dev
   ```

3. Open [http://localhost:5173](http://localhost:5173) or [http://3.250.66.213:3000](http://3.250.66.213:3000) in your browser.

---

### 3️⃣ **Run Using Docker 🐳**

1. **Build the Docker Image:**

   ```bash
   docker build -t online-shop:latest .
   ```

2. **Run the Docker Container:**

   ```bash
   docker run -d -p 3000:5173 online-shop:latest
   ```

3. Open [http://localhost:5173](http://localhost:5173) or [http://3.250.66.213:3000](http://3.250.66.213:3000) in your browser.

---

### 4️⃣ **Run Using Docker Compose 🐳**

1. **Start the app using Docker Compose:**

   ```bash
   docker-compose up
   ```

2. Open [http://localhost:3000](http://localhost:3000) or [http://3.250.66.213:3000](http://3.250.66.213:3000) in your browser.

---

### 5️⃣ **Production Build**

1. **Generate optimized production files:**

   ```bash
   npm run build
   ```

2. **Preview the build:**

   ```bash
   npm run preview
   ```

---

## 📋 **Dockerfile Explanation**

```dockerfile
# Pull base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy app source code
COPY . .

# Install dependencies
RUN npm install

# Expose the port used by Vite
EXPOSE 5173

# Run the development server
CMD ["npm", "run", "dev"]
```

```

## 📋 **Docker Multi-Stage Build Explanation**

```dockerfile
# Stage 1: Install dependencies using slim for minimal size
FROM node:20-slim AS builder

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
EXPOSE 5173

# Run the app
CMD ["npm", "run", "dev"]
```

---

## 📋 **Docker Compose File Explanation**

```yaml
# Use Docker Compose version 3.8
version: '3.8'

# Define services (containers) to run
services:
  # Define the 'app' service
  app:
    # Build configuration for the app service
    build:
      # Use the current directory as the build context
      context: .
      # Specify the Dockerfile to use for building the image
      dockerfile: Dockerfile

    # Map ports between the host and the container
    ports:
      # Map port 3000 on the host to port 5173 in the container
      - "3000:5173"

    # Set environment variables inside the container
    environment:
      # Set NODE_ENV to production for optimized builds
      - NODE_ENV=production

    # Configure volumes for code sharing and persistence
    volumes:
      # Mount the current directory to /app in the container for live code updates
      - .:/app
      # Ensure node_modules inside the container isn't overwritten by the host
      - /app/node_modules

    # Override the default command and run the app in development mode
    command: ["npm", "run", "dev"]
```

---


## ⚡ **Common Issues & Solutions**

1. **Vite Running on Wrong Port?**
   - By default, Vite uses **5173**. Ensure you're mapping ports correctly when running Docker:
     ```bash
     docker run -p 3000:5173 online-shop:latest
     ```

2. **Sass Deprecation Warnings?**
   - The warning is from `sass-embedded`. To fix it:
     ```bash
     npm install sass --save-dev
     ```

3. **Vite Config Changes Require Re-Optimization?**
   - Clear Vite cache:
     ```bash
     rm -rf node_modules/.vite
     npm run dev
     ```

---

---

## 📤 **Submission Details**

- **Full Name:** Amrita Kumari
- **Email Address:** amitasuri493@gmail.com
- **GitHub Repo:** [GitHub Repository Link](https://github.com/amrita122/online_shop.git)

---

## 📣 **Sharing for Extra Points 🚀**

- **LinkedIn Post:** [My LinkedIn Share]([https://linkedin.com/in/your-profile](https://www.linkedin.com/feed/update/urn:li:activity:7298377010966315009/))

---

## 📑 **License**

MIT License © Amrita Kumari

---

💡 *Made with 💖 using React, Vite, Node and Docker.*


