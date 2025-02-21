Git & Docker Setup - Hackathon Task (Shivling Balurage)

1. Launch EC2 Instance & Connect
   - Start EC2 instance on AWS
   - Connect using SSH

2. Clone Git Repository
   - Fork the repo & copy the URL
   - git clone <repo-url>
   - cd <repo-name>

3. Initialize Git & Create a Branch
   - git init
   - git add .
   - git branch
   - git checkout -b docker/dockerfile-creation
   - git commit -m "Added Dockerfile"


4. Set Remote & Push Code
   - git remote set-url origin https://personal tocker@github.com/github.com/Shivling-dev/Online_shop, I'm Facing Error like no such remote 'origin then i user add origin        
   - git remote add origin <repo-url>
   - git remote -v
   - git push origin docker/dockerfile-creation
   - git log

5. Install & Start Docker
   - sudo apt update
   - sudo apt install docker.io -y
   - sudo usermod -aG docker $USER  # Add user to Docker group  
   - sudo systemctl start docker
   - sudo systemctl enable docker

6. Create Dockerfile
   - FROM node:latest
   - WORKDIR /app
   - COPY . .
   - RUN npm install
   - CMD ["npm", "start"]
   - EXPOSE 5173

7. Build & Run Docker Container
   - docker images
   - docker stop $(docker ps -aq)
   - docker rm $(docker ps -aq)
   - docker build -t online_shop .
   - docker run -d -p 5173:5173 --name=onlineshop online_shop:latest

8. Verify & Access App
   - docker ps
   - Open browser: http://<EC2-IP>:5173

Task Completed ✅

