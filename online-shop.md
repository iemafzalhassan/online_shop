# Online Shop App Dockerizing Project

This is an online shopping eCommerce application that has been containerized using Docker. The application consists of a frontend only. The goal of this project is to set up the application using Docker containers, enabling easy deployment, scalability, and environment consistency. This app will be hosted using GitHub for version control and Linux tools for development and deployment.


## Project Overview

This is an e-commerce platform that allows customers to browse products, add them to a cart, and checkout. It is built using a modern web stack and is dockerized for easy deployment.

## Tech Stack

- **Frontend**: React.js, HTML, CSS
- **Containerization**: Docker
- **Version Control**: Git, GitHub
- **File Operation/Pemission/Management**: Linux

## Getting Started

### Prerequisites

- Git
- Docker
- Node.js
- Install dependencies: npm install

### Best practices I applied to dockerfile

- .dockerignore
it will help not copying all unncessary files, modules to the docker image so docker image will be light.

### Retrospective
I have added a screenshot of the port 3000 given in the src folder is not matching with the actual port is running the docker image on 5173.
Please check the screenshot below:
![App Screenshot](https://github.com/jkabirqa/online_shop/blob/feature/dockerize-online-shop-app/portMismatch.png?raw=true)

### Push docker image to the dockerhub

https://hub.docker.com/repository/docker/jkabirm/myonline-shop/general

### Video
https://drive.google.com/file/d/1egUbir9eNx20JjbGki_FYEc6tj0BR__q/view?usp=drive_link
