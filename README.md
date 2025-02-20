# Online Shop - Hackathon Phase 1 Submission

## Project Overview
This repository contains the **Online Shop** project completed as part of Hackathon Phase 1. The project demonstrates expertise in **Git & GitHub, Linux, and Docker** by implementing best practices in version control, system configuration, and containerization.

## Steps to Complete the Project

### 1️ - Git & GitHub Setup

- #Fork the repository to your GitHub account
- ``git fork repo``

- #Clone the repository to your local machine
- ``git clone <repository-url>``

- #Change to the project directory
- ``cd online_shop``

- #Create a new branch for development
- ``git checkout -b online_shop_branch``

- #Verify branch creation
- ``git branch``
---

### 2️ - Linux System Setup

- #Update package lists
- ``sudo apt-get update``

- #Install Node.js and npm
- ``sudo apt install npm``
- ``sudo apt install nodejs``

---

### 3️ - Docker Installation & Configuration
- #Install Docker
- ``sudo apt install docker.io``

- #Verify Docker installation
- ``docker --version``

- #Add current user to the Docker group (to run Docker without sudo)
- ``sudo usermod -aG docker $USER`` 
- ``newgrp docker`` 

- #Start the Docker service
- ``sudo systemctl start docker`` 
---

### 4️ - Docker Containerization

- #Create a Dockerfile 
- ``docker build -t dockerfile .``

- #Run the Docker container
- ``docker run -p 3000:5173 online_shoping``

- #Check running containers
- ``docker ps``

- #Stop rinning container (from another server)
- ``docker stop <container-id>``



### 5️ - Committing Changes to GitHub

- #Stage the Dockerfile for commit
- ``git add Dockerfile``

- #Commit changes with a descriptive message
- ``git commit -m "Added Dockerfile"``

- #Push changes to the repository
- ``git push origin online_shop_branch``


---

### 6️ - Additional Files Added
- **dockerfile** → Contains instructions to containerize the application.
- **README.md** → This documentation file.

- **.gitignore** → Specifies files to be ignored by Git.

## Final Submission Branch
- **Final Submission Branch:** `online_shop_branch`
## About ME

- **Linkedin profile** - (https://www.linkedin.com/in/sumit-gujar-318229289/)
- **GitHub** - (https://github.com/Sumitgujar)
- **Hackathon Video** - (https://youtu.be/862ETYbgJCk?si=ikkZ0rC9lo9TwQ6u)



