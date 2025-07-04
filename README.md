# 🛍️ Online Shop – Dockerized CI/CD with Jenkins

This project demonstrates how to containerize a Vite-based frontend (or fullstack app) and automate the CI/CD process using Jenkins, GitHub Webhooks, and Docker Hub.

---

## 🚀 Features

- ✅ Multi-stage Dockerfile for clean, production-ready images  
- ✅ GitHub webhook integration for auto-triggering builds  
- ✅ Jenkins pipeline for build → test → push → deploy  
- ✅ Docker Hub integration for storing built images  
- ✅ Docker Compose for local & production deployment  

---

## 📁 Project Structure
.
├── Dockerfile-multi
├── docker-compose.yml
├── Jenkinsfile
├── src/
│ └── (your app code)
└── README.md


Jenkinsfile

pipeline {...}

🌐 Step 3: Setup GitHub Webhook
Go to your GitHub repo → Settings → Webhooks

Click “Add Webhook”

Payload URL: http://<your-server-ip>:8080/github-webhook/

Content type: application/json

Event: Just the push event




🔐 Step 4: Add Docker Hub Credentials in Jenkins
Go to Jenkins → Manage Jenkins → Credentials

Click Global → Add Credentials

Add:

Type: Username with password

ID: dockerhubId

Scope: Global


![Screenshot 2025-07-04 123103](https://github.com/user-attachments/assets/8d406d7d-baa4-4edf-8a17-7f60b6fcce1a)



🐳 Step 5: Docker Compose

version: '3.8'

services:
  online_shop:
    container_name: my-app
    image: suyashdahitule/online-app:latest
    ports:
      - "5173:5173"
    restart: always
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:5173/"]
      interval: 60s
      timeout: 10s
      retries: 5
    networks:
      - online_shop

networks:
  online_shop:
    driver: bridge

![Screenshot 2025-07-04 125847](https://github.com/user-attachments/assets/8ab32636-fddb-4cd2-ac0a-6199444b5dbc)


✅ Final CI/CD Flow
Pushed code to the project branch on GitHub

GitHub Webhook triggers Jenkins

Jenkins:

Clones the repo

Builds the Docker image

Pushes it to Docker Hub

Deploys it with Docker Compose

App is live on:
http://<your-server-ip>:5173


![Screenshot 2025-07-04 125538](https://github.com/user-attachments/assets/998c6a9d-154f-486a-96ff-17083f641371)


🙌 Author
Made with ❤️ by Suyash Dahitule


