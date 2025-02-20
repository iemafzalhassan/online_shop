#FIRST CLONE THE REPOSITORY TO THE SYSTEM 

1: git CLONE

#CREATE A BRANCH IN LIKE FEATURE BRANCH

2: git checkout -b "branch-name"


#docker file 

from node:18
workdir /app
copy pakages.jason ./
run npm install
expose 5173
cmd ["npm","run","dev"]

#build a image 

3: docker build -t "name-of-image" .


#containertization

docker run -d --name "container-name" -p 5173:5173 image-name:latest


#docker compose.yml

version: "3.8"
services:
    name:
      image: 
      container-name:
      ports:


#you can successfully deploy your website at port no 5173

Note : dont forgot to edit you inbound rules and add 5173 ports

linkedin: "https://www.linkedin.com/in/swayam-nakshane-3b29b0346?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app"
docker : "https://hub.docker.com/u/swayamnakshane"
github: "https://hub.docker.com/u/swayamnakshane"
