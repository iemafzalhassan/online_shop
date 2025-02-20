step 1:Docker installed on Ec2
  sudo apt-get update
  sudo apt-get install docker.io
  sudo usermod -aG docker ubuntu
  newgrp docker
   
Step 2 Clone the fork Repository  
   mkdir gir_repo
   git clone https://github.com/deepakyelwande15/online_shop.git 
   cd git_repo

 Step 3 Create Dockerfile
   # Node.js base image
   FROM node:18-alpine

   # Set the working directory inside the container
   WORKDIR /app

   # Copy all source 
   COPY . .

   # Install dependencies
   RUN npm install && npm run build

   # Expose port 3000 
   EXPOSE 3000

   # Start development server
   CMD ["npm", "run", "dev"]

Step 4 Build and Run Docker Container
   docker build -t react-app:latest .

   docker run -d -p 3000:3000 treact-app:latest

Step:5 check docker logs 
  app run on localhost:5173

 change the vite.config.js file add the port no 3000 because that is expose in docker file
 again rebuild the docker image and run the container
