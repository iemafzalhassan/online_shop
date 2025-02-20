# Online Shop 🛍️ for Hackathon Phase 1 Dockerized App

<p align="center">

- Forked the online shop app repo.
- Created an AWS EC2 instance.
- Updated the system, installed docker.
- Cloned the forked repo and created a new branch.
- Wrote the Dockerfile, and built the docker image & created a container of that image.
  
  ` docker build -t online_shop_app:v1 . `
  
  ` docker run -d --name online_shop_app -p 80:4173 online_shop_app:v1 `
