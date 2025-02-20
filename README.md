# Online Shop – Hackathon Phase 1 Submission

## Project Overview  
This project is an **Online Shop** built as part of the **Hackathon Phase 1 Submission**. It showcases proficiency in **Git & GitHub, Linux, and Docker**, covering repository management, system administration tasks, and containerization best practices.

## Tasks & Implementations  

### Git & GitHub
- Used **Git for version control**, effectively managing branches.  
- Maintained a **clean commit history** with meaningful commit messages.  
- Created **pull requests and merged changes** efficiently.

### Linux
- Set up an **Ubuntu EC2 instance** for deployment.  
- Used **Linux commands** for system administration.  
- Managed **file permissions, environment variables, and processes**.  

### Docker & Nginx
- Built a **Dockerfile** to containerize the application.  
- Created a **docker-compose.yml** file to manage multiple services (Nginx & MySQL).  
- Configured **Nginx as a reverse proxy** to serve the application.  

---
## Task Descriptions & Implementations

### Git & GitHub
Forked from the Hackathon Github 

Managed the project repository using Git and GitHub.

Used a feature branching strategy (feature/devops-feature).

Ensured clear commit messages following best practices.

Created pull requests for each feature and merged them after review.

Maintained a clean and structured Git history.

### Linux Commands & System Administration

Used Ubuntu EC2 for Deploying docker.

Installed necessary packages 

Error solving

### Docker Integration & Containerization

Dockerized the application using a Dockerfile based on the Nginx image.

Configured Docker Compose to manage the frontend and MySQL database as services.

Created a custom Nginx configuration to properly serve the frontend.

Finally pushed the Docker Image to docker hub .

## How to Run the Application Locally  

### 1️⃣ Clone the Repository  
Open your terminal and run the following command:  

git clone <repo-link>
cd online_shop

### 2️⃣ Build and Start Services with Docker
Ensure Docker and Docker Compose are installed on your system.
Then, run the following command:

docker-compose up --build -d

✅ This will:
Build the application
Start Nginx (port 8080) & MySQL (port 3306)
Serve the app on:

http://localhost:8080

### 3️⃣ Verify Running Containers
To check if the containers are running, execute:

docker ps

### 4️⃣ Stopping the Application
To stop and remove the running containers, use:

docker-compose down

## 🔥 Key Changes & Enhancements
✅ Added Docker support with optimized Dockerfile & Docker Compose setup.

✅ Configured Nginx for production-ready deployment.

✅ Enhanced security by properly handling environment variables.

✅ Deployed to EC2

## 📢 Final Submission Statement
This repository represents my final submission for Hackathon Phase 1.

## 🏷️ Version/Branch Information
Final submission branch: feature/devops-feature

🎥 Video Demo
📹 Watch the demo here. https://drive.google.com/file/d/1nFv2fYBqXYx7k1LzvN8KcDmcFXB_Sclf/view?usp=drive_link



