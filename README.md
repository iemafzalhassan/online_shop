<img width="1470" alt="Project ss" src="https://github.com/user-attachments/assets/11350cf1-a03c-4021-8dad-3149f2947b09" />


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
git clone https://github.com/amitsingh790634/Ecommare_Online_Shop.git
cd Ecommare_Online_Shop
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

## Check Docker File code by 
``` 
cat Dockerfile
```
<img width="571" alt="Create Docker File" src="https://github.com/user-attachments/assets/f631dc3e-96d1-470c-a04e-cdc4b9dad4c8" />

## Check Docker File code by 
```
ls 
```

## Check List Docker File
``` 
ls
```
<img width="1361" alt="Second Check Doker File" src="https://github.com/user-attachments/assets/9ce9f28c-1c82-46ff-b186-f5ea4aa8d143" />

## Check List Docker File
``` 
docker build -t online_shop:v1 .
```

<img width="1449" alt="Third Create docker build" src="https://github.com/user-attachments/assets/277585e3-48b3-44fb-be49-742edcb741f2" />

## Check List Docker File
``` 
docker run -p 3000:5173 online_shop:v1 
```

<img width="926" alt="4 Docker run images" src="https://github.com/user-attachments/assets/a5f155bd-94fd-4706-9cbb-bed20a7a1bea" />


---

# OUTPUT

<img width="1470" alt="Project ss" src="https://github.com/user-attachments/assets/80952808-54bf-44a9-943a-f396ed00d920" />



## 📋 **Docker Multi-Stage Build Explanation**

```dockerfile
# Stage 1: Install dependencies using Alpine for minimal size
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

## docker image size
<img width="496" alt="Image Size reduce" src="https://github.com/user-attachments/assets/e997a8a0-3ed7-4a2e-8e47-e132cc42914f" />

## docker multi-stage file
<img width="922" alt="Check Docker Multi-stage file" src="https://github.com/user-attachments/assets/0e96208d-2d67-411a-8d48-5155cabf2b1b" />

## docker image size reduce 
<img width="748" alt="Image Size" src="https://github.com/user-attachments/assets/398a4241-d62b-4695-926a-f672883b11ea" />



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

# Docker Compose file
<img width="1470" alt="Docker Compose File" src="https://github.com/user-attachments/assets/732bf536-0d00-423f-97f9-3d2a538137ba" />


# Docker UP Compose file
<img width="1470" alt="Docker up" src="https://github.com/user-attachments/assets/555d5d97-f855-4368-97ec-49e87da29a2c" />

# Docker Compose Video
## https://go.screenpal.com/watch/cTnYlenhJHj



## ⚡ **Common Issues & Solutions**

1. **Vite Running on Wrong Port?**
   - By default, Vite uses **5173**. Ensure you're mapping ports correctly when running Docker:
     ```bash
     docker run -p 3000:5173 online-shop:v1
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

## 🎬 **Demo Video 📽️**

🔗 [Link to Demo Video](https://go.screenpal.com/watch/cTnYXNnhJGz)
🔗 [Link to Demo Video](https://go.screenpal.com/watch/cTnYlenhJHj)
🔗 [Link to Demo Video](https://go.screenpal.com/watch/cTnYlenhJHQ)



*The demo explains the project setup, Docker integration, and running the app.*

---

## 📤 **Submission Details**

- **Full Name:** Amrita Kumari
- **Email Address:** amitasuri493@gmail.com
- **GitHub Repo:** [GitHub Repository Link](https://github.com/amrita122/online_shop.git)
- **Demo Video:** [Watch Here](https://go.screenpal.com/watch/cTnYlenhJHQ)

---

## 📣 **Sharing for Extra Points 🚀**

- **LinkedIn Post:** [My LinkedIn Share]([https://linkedin.com/in/your-profile](https://www.linkedin.com/pulse/building-online-shop-using-vite-react-docker-amit-singh-pbydc))


---

## 📑 **License**

MIT License © Amit Singh

---

💡 *Made with 💖 using React, Vite, and Docker.*


