🛍️ Online Shop – DevSecOps-Enabled CI/CD with Jenkins
This project demonstrates how to build a secure and automated CI/CD pipeline using Jenkins, GitHub Webhooks, Docker, Docker Hub, SonarQube, and Trivy for a Vite-based frontend (or fullstack) app.

🚀 Features
✅ Multi-stage Dockerfile for clean, production-ready images
✅ GitHub Webhook to auto-trigger Jenkins builds
✅ Jenkins pipeline: build → scan → test → push → deploy
✅ SonarQube integration for code quality & vulnerability scanning
✅ Trivy integration for filesystem & Docker image vulnerability scanning
✅ Docker Hub to store production-ready images
✅ Docker Compose for seamless local/production deployment

📁 Project Structure
.
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── sonar-project.properties
├── src/
│   └── (your app code)
└── README.md

🧪 #Security Steps (DevSecOps)#

🔎 SonarQube (Static Analysis)

Detect code smells, bugs, security hotspots (e.g., XSS, SQLi)

Automatically fails pipeline if quality gate fails

![Screenshot 2025-07-04 232210](https://github.com/user-attachments/assets/d7c2e9c1-6cac-4285-9a95-d9396b751f00)

🛡️ Trivy FileSystem Scan

Scans source code, config files for secrets, misconfig, known CVEs

🐳 Trivy Docker Image Scan

Scans Docker image layers for vulnerabilities (CVEs)

🧾 Reports

Trivy & SonarQube results archived in Jenkins HTML Reports

Slack/email notifications can be added

 Jenkinsfile (CI/CD + DevSecOps)

pipeline{..}



🌐 Step-by-Step Setup
1️⃣ GitHub Webhook
Go to GitHub → Repo → Settings → Webhooks

Payload URL: http://<your-jenkins-ip>:8080/github-webhook/

Content type: application/json

Event: Push event only


2️⃣ Add SonarQube & DockerHub Credentials in Jenkins
Go to Jenkins → Manage Jenkins → Credentials → Global → Add Credentials:

Type: Username with password

ID: dockerhubId

Scope: Global



3️⃣ Docker Compose File (docker-compose.yml)




![Screenshot 2025-07-04 232149](https://github.com/user-attachments/assets/9b462210-5350-4b53-aff9-23c741f3c5f5)

✅ Final DevSecOps CI/CD Flow
Code is pushed to GitHub

Webhook triggers Jenkins

Jenkins:

Pulls code

Runs SonarQube for static code security checks

Runs Trivy to scan filesystem

Builds Docker image

Runs Trivy image scan

Pushes image to DockerHub

Deploys via Docker Compose

HTML reports are generated & archived


![Screenshot 2025-07-04 232008](https://github.com/user-attachments/assets/4062df32-6795-4dac-ab6c-9f78c0f9f982)

🙌 Author
Made with ❤️ by Suyash Dahitule
