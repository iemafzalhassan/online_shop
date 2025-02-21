PROJECT TILE : 🛍️ Online Shop – Hackathon Phase 1 Submission 


## Overview
The file to check is in branch hackathon_solution => Dockerfile Dockerfile_multistage

- **Git & GitHub:** First thing is to fork the project into my respository and make a clone in the local EC2 instance.
   * Then Git INIT ( git init )  in the working directory to TRACK all the changes in the file and commit it.
   * git status - tells you which files are not being tracker in the current folder
   * git clone is used to clone the project in our local repository :- git clone https://github.com/abeyvaz/online_shop.git
   * git add Dockerfile & Dockerfile_multistage to track the changes
   * git commit -m " message " Dockerfile Dockerfile_multistage
   * git branch
   * git add Dockerfile_multistage
   * git commit -m "final Dockerfile_multistage" Dockerfile_multistage
   * git push origin hackathon_solution
  
- **Linux:**  These commands are fundamental for performing various tasks in a Linux-based operating system for experienced users. linux commands can be used to navigate through the files / respositories.
  - It is used to install docker file - sudo apt-get install docker.io
  - Added $USER in docker group - sudo usermod -aG docker $USER
  - To login into the new group docker - newgrp docker
  - created a new Docker file - vim Dockerfile
    * To navigate through the file system - cd , cd ..
    * To show the list of files & their permissioned - ls , ls -l
    
- **Docker:** Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers. The service has both free and premium tiers. The software that hosts the containers is called Docker Engine.
  - Created a Docker file - vim Dockerfile & Dockerfile_multistage 
      * Docker ps :- to show all the running container
      * Docker ps -a :- will show you all the stopped containers  
      * Docker images - to show all the images
      * Docker stop ID  - will stop the running images
      * Docker system prune - will clear all the stopped containers
       
The below are the steps needed to build a docker file 

#BASE OS
FROM node:22-alpine3.20

#working directory for the app
WORKDIR /app

#COPY the code from your HOST to your Container 
COPY . .

#Run the command to install the Lib to compile code 
RUN npm install

#EXPOSE the port 
EXPOSE 5173

#Serve the app / Keep it running 
CMD ["npm","run","dev"]


========

#Stage1
FROM node:20-slim AS builder

#working directory for the app
WORKDIR /app

#copy dependencies
COPY package.json .

#Run the command to install the Lib to compile code 
RUN npm install

#copy rest of the application
COPY . .


#Stage 2 

FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

COPY --from=builder /app .

#EXPOSE the port 
EXPOSE 5173

#Serve the app / Keep it running 
CMD ["npm","run","dev"]



    



    

    

