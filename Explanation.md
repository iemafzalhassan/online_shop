# Building and Optimizing a Dockerized Online Shop

This document outlines the process of containerizing a simple online shop application using Docker, demonstrating both single-stage and multi-stage build strategies, and finally deploying the application with Nginx as a web server.

## Project Setup

1.  **Create Project Directory:** A directory named `hackathon` is created to house all project related files.

    ```bash
    mkdir -p hackathon && cd hackathon
    ```

2.  **Clone Repository:** The online shop source code is cloned from the GitHub repository.

    ```bash
    git clone https://github.com/microaditi/online_shop.git
    cd online_shop
    ```

## Single-Stage Dockerfile

A simple `Dockerfile-single-stage` is created (check file in the repo).  This approach is straightforward but can result in a larger image size.

```bash
vi Dockerfile-single-stage # (Create the file)
docker build -f ./Dockerfile-single-stage -t onlineshop:single .
docker run -d -p 5173:5173 --name online-shop-single onlineshop:single
```
Use code with caution.
Bash
The Docker image onlineshop:single is then built and run, mapping port 5173 on the host to port 5173 in the container. This allows accessing the online shop application.


## Multi-Stage Dockerfile
A Dockerfile (named simply as such) is created employing multi-stage builds. Multi-stage builds significantly optimize image size by utilizing separate stages for building and runtime, discarding build tools and dependencies in the final image. This increases security by reducing the attack surface, and minimizing image size makes deployments faster and reduces storage requirements.

```bash
vi Dockerfile # (Create the file)
docker build -f ./Dockerfile -t onlineshop:multi .
docker run -d -p 3000:5173 --name online-shop-multi onlineshop:multi
```
Use code with caution.
Bash
The Docker image onlineshop:multi is built and run, mapping port 3000 on the host to port 5173 in the container.

## Multi-Stage Dockerfile with Nginx
The repository contains a Dockerfile-nginx. This Dockerfile demonstrates a more sophisticated approach by using a multi-stage build to leverage Nginx as a web server to serve the application. The application is built in one stage, and then the built artifacts (presumably from a dist folder) are copied to Nginx's html directory in a subsequent stage. This effectively hosts the application using Nginx's efficient serving capabilities.
``` bash 
docker build -f ./Dockerfile-nginx -t onlineshop:nginx .
docker run -d -p 80:80 --name online-shop-nginx onlineshop:nginx
```
Use code with caution.
Bash

The onlineshop:nginx image is built, and then a container named online-shop-nginx is created, mapping port 80 on the host to port 80 in the container. This means the online shop application can now be accessed through a web browser at the host's address on port 80, served by Nginx. The key advantage here is leveraging Nginx's web server capabilities instead of the application's built-in development server which is not optimized for production environments. The dist folder contains the prebuilt artifacts, and the Nginx configuration serves these static files to users.



## Docker Images

The `docker images` command lists the Docker images available on your system. Here's the output from the command:
Use code with caution.
```bash
REPOSITORY TAG IMAGE ID CREATED SIZE
onlineshop nginx 32805ee4de2c 47 minutes ago 193MB
<none> <none> 406b98cca6ce 47 minutes ago 322MB
<none> <none> a4d93b302622 48 minutes ago 321MB
onlineshop singlestage 0c1b4a77ca3b 51 minutes ago 321MB
onlineshop multistage 775af59860b9 52 minutes ago 228MB
node 18-slim b4406da599d9 9 hours ago 192MB
node 18-alpine 78649fe1a0d7 9 hours ago 127MB
nginx latest 97662d24417b 2 weeks ago 192MB
```

From the image sizes listed, the onlineshop:nginx image has the smallest footprint, followed by onlineshop:multistage, and then onlineshop:singlestage.

```bash
onlineshop nginx 193MB
onlineshop multistage 228MB
onlineshop singlestage 321MB
```
