# Online Shop – Hackathon Phase 1 Submission

## Overview
This repository contains my submission for **Hackathon Phase 1**, where I enhanced the **Online Shop** project by implementing best practices in **Git & GitHub, Linux, and Docker**. My focus was to optimize the development workflow, improve system operations using Linux, and containerize the application effectively using Docker.

## Task Descriptions & Implementations

### **Git & GitHub**
- **Repository Management**: Forked and cloned the original repository, created a new branch (`hackathon`) to track my changes.
- **Version Control Best Practices**:
  - Made **descriptive commits** for every major change.
  - Used **feature branching** to ensure clean and maintainable history.
  - Created **pull requests** to document my changes before merging.
- **Workflow Optimization**: Proposed improvements to the Git workflow, including proper branching strategies and pull request templates.

#### **Key Git Commands Used:**
```sh
# Cloning the repository
git clone https://github.com/suryansh639/online_shop.git

# Creating and switching to a new branch
git checkout -b hackathon

# Adding and committing changes
git add .
git commit -m "Implemented Docker support and optimized Git workflow"

# Pushing changes to the forked repository
git push origin hackathon
```

---

### **Linux**
- **Command-Line Proficiency**:
  - Used **Linux commands** for file operations, process management, and package installations.
  - Debugged issues using **log files** and Linux utilities.
- **System Administration Improvements**:
  - Ensured correct **file permissions** and ownership settings.
  - Monitored system processes and optimized resource utilization.
- **Documentation**: Added detailed documentation on Linux commands and how to troubleshoot common issues.

#### **Key Linux Commands Used:**
```sh
# Checking logs for troubleshooting
cat /var/log/syslog | grep error

# Setting correct file permissions
chmod -R 755 /app

# Monitoring active processes
ps aux --sort=-%mem | head -10
```

---

### **Docker**
- **Containerization of the Application**:
  - Implemented a **multi-stage Dockerfile** to optimize image size and performance.
  - Ensured proper **dependency management** and used best practices for running a Node.js application in a container.
- **Docker-Compose Setup**:
  - Created a **docker-compose.yml** file to manage the application's services.
  - Allowed for easy deployment and scaling using **Docker Compose**.
- **Ensured Docker Readiness**:
  - Verified that the codebase follows **Docker best practices**, making it ready for deployment on **AWS, Azure, or GCP**.

#### **Dockerfile (Multi-Stage Build)**
```dockerfile
# Stage 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Run
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
EXPOSE 5173
CMD ["npx", "serve", "-s", "dist"]
```
![Screenshot](https://github.com/suryansh639/online_shop/blob/hackathon/multistage.png)

#### **Docker Commands Used:**
```sh
# Building the Docker image
docker build -t online-shop-app .

# Running the container
docker run -p 5173:5173 online-shop-app

# Checking running containers
docker ps
```

---

## **Final Submission Statement**
This repository represents my final submission for **Hackathon Phase 1**. The implemented solutions ensure:
- ✅ **Clean and structured Git workflow**
- ✅ **Optimized Linux operations and debugging techniques**
- ✅ **Best practices in Docker containerization**

🔗 **Demo Video:** [Insert Link Here]

### **Branch for Evaluation**
```
Final submission branch: hackathon
```

This submission reflects my understanding and enhancements of GitHub workflows, Linux system administration, and Docker containerization. 🚀


