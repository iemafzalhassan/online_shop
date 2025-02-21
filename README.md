# Online Shop – Hackathon Phase 1 Submission

[![Stars](https://img.shields.io/github/stars/SuperSection/online_shop)](https://github.com/SuperSection/online_shop)
![Forks](https://img.shields.io/github/forks/SuperSection/online_shop)
![GitHub last commit](https://img.shields.io/github/last-commit/SuperSection/online_shop?color=red)
[![GitHub Profile](https://img.shields.io/badge/GitHub-SuperSection-blue?logo=github&style=flat)](https://github.com/SuperSection)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Overview

This repository contains my submission for **Hackathon Phase 1**, focusing on Dockerization, Nginx configuration, Linux operations, and debugging networking issues in Docker. My work is presented in the `submit/hackathon-phase-1` branch, where I have structured the application for deployment in a containerized environment.

## Table of Contents

- [Overview](#overview)
- [Work Done](#work-done)
- [Run the Dockerized Application](#how-to-run-the-dockerized-application)
- [Submission Details](#submission-details)
- [License](#license)
- [Author](#author)

---

## Work Done

### **1. Dockerizing the Application**

I created a **multi-stage Dockerfile** to build and serve the React-based Online Shop application efficiently. The approach includes:

- **Stage 1: Build Phase** (Using `node:20-alpine`)
  - Installed dependencies using `npm ci`
  - Built the application using `npm run build`

- **Stage 2: Production Phase** (Using `nginxinc/nginx-unprivileged:1.25-alpine`)
  - Removed the default Nginx configuration
  - Copied the built React app (`dist` folder) from the build stage
  - Applied security best practices in Nginx configuration
  - Exposed ports **8080** and **8443** for HTTP and HTTPS access

### **2. Nginx Configuration**

I customized the `nginx.conf` file to:

- Serve the built React app from `/usr/share/nginx/html`
- Redirect all requests to `index.html` for proper SPA routing
- Implement security headers:
  - `X-Frame-Options DENY` (Prevents Clickjacking)
  - `X-Content-Type-Options nosniff` (Prevents MIME-type sniffing)
  - `X-XSS-Protection "1; mode=block"` (Prevents XSS attacks)
- Deny access to hidden files (e.g., `.env`, `.git`)

### **3. Understanding the Application Structure**

I reviewed the codebase to understand how the application is structured:

- **Frontend:** Built with React and Vite
- **Configuration Files:** `vite.config.js`, `package.json`
- **Static Assets:** Located in `public/`
- **CSS Styling:** `index.css` in the root of the repo
- **Entry Point:** `index.html`

### **4. Linux Commands Used**

During the process, I used various Linux commands:

- **File Management:**
  - `ls -lah` - - List all files (including hidden) with detailed permissions and human-readable sizes
  - `cp` - Copy files and directories
  - `rm -rf` - Recursively remove files and directories (use with caution)

- **Process Monitoring:**
  - `ps aux | grep nginx` - Search for running Nginx processes
  - `top` - Display real-time system process information

- **Resolved Networking Issues:**
  - `nslookup registry-1.docker.io` - DNS lookup for Docker registry
  - `curl -v https://registry-1.docker.io/v2/` - Test connectivity to Docker registry
  - `sudo netstat -tulnp | grep 8080` - Check processes listening on port 8080
  - `sudo systemctl stop ufw` - Disable Ubuntu firewall (optinally)

- **System Management:**
  - `cat /etc/os-release` - Display OS version information
  - `sudo lsof -i :8080` - List processes using port 8080
  - `sudo nano /etc/resolv.conf` - Edit DNS resolver configuration, by adding the following

    ```plaintext
    nameserver 8.8.8.8
    nameserver 8.8.4.4
    ```

  - `sudo systemctl restart networking` - Restart network services
  - `sudo kill -9 <PID>` - Force terminate a process

### **5. Docker Commands Used:**

#### **Container Management**

- `docker build -t online-shop .`  Build image named 'online-shop'
- `docker run -d -p 9090:8080 online-shop` - Run container in background, map ports
- `docker ps` - List running containers
- `docker logs <container_id>` - View container logs
- `docker inspect <container_id>` -  - Show detailed container information

#### **Cleanup Commands**

- `docker stop $(docker ps -aq)` - Stop all containers
- `docker rm $(docker ps -aq)` - Remove all containers
- `docker images` - List all images
- `docker rmi <image_id>` - Remove specific image
- `docker system prune -f` - Remove unused data

### **6. Git Commands**

#### **Branch Operations**

- `git checkout -b <new-branch-name>` - Create and switch to new branch
- `git checkout <branch-name>` - Switch to existing branch
- `git branch` - List branches

#### **Code Management**

- `git add .` - Stage all changes
- `git add <filename>` - Stage specific file
- `git commit -m "commit message"` - Commit staged changes
- `git push origin <branch-name>` - Push commits to remote repository

### **7. Git Branching Strategy**

I followed **Git best practices** by:

- Creating a New branch for Containerizing the Application: `feature/dockerization`
- Another branch for Fixing UI in Admin-page: `fix-ui/admin-page_product-card`
- Final branch to merge all changes and push it as Phase 1 Submission of Hackathon: `submit/hackathon-phase-1`
- Committing changes with meaningful messages
- Keeping the main branch clean

### **8. Debugging Docker Network Issues**

I faced and resolved the following networking issues:

- **Issue: Nginx not serving files inside the container**
  - Debugged using `docker exec -it <container_id> sh`
  - Verified files were present in `/usr/share/nginx/html`
  - Fixed incorrect permissions using `chown -R nginx:nginx /usr/share/nginx/html`

- **Issue: Application not accessible on `localhost:8080`**
  - Ran `docker ps` to check if the container was running
  - Used `docker inspect` to verify the container's exposed ports
  - Fixed by ensuring the container ran with `-p 9090:8080` (pick a non-reserved port)

---

## How to Run the Dockerized Application

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/SuperSection/online_shop.git
   cd online_shop
   ```

2. **Build the Docker Image:**

   ```bash
   docker build -t online-shop:latest .
   ```

3. **Run the Container:**

   ```bash
   docker run -d --name online-shop-app -p 9090:8080 online-shop
   ```

4. **Access the Application:**
   Open [http://localhost:9090](http://localhost:9090) in your browser.

---

## Submission Details

- **Final Submission Branch:** `submit/hackathon-phase-1`
- **Enhancements Implemented:** Dockerization, Nginx configuration, Linux commands, debugging Docker network issues
- **Video Demo:** [Link to the video] *(To be updated)*

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

For any information, please reach out to me:

- **Name:** Soumo Sarkar
- **Email:** [soumosarkar.official@gmail.com](mailto:soumosarkar.official@gmail.com)

---

Thank you for reviewing my submission! 🚀
