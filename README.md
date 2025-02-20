# For this Front-End-only application added the Multi-stage Docker File and Docker Compose file

## Multi-Stage Docker File
1. Used **Base Stage** as an initial stage which acts as the Base image to install all dependencies
2. Once the build is done with this Stage, use another **'Final Stage'** using small Alpine images and copy the built app from the Base Stage to the Final Stage Image.
3. Using the Multi-Stage built final image will be much smaller in size which helps in faster deployment
4. Steps included in Docker File:
   ## ------------ Base Stage -------------
FROM node:18.18-alpine AS builder   --->> Acts as Base Image for our application

## Setting Work Directory   --->> default work directory in Docker Container where all files stores
WORKDIR /app

## Copy package.json and package-lock.json --->> Copy these separately as these are fixed   
COPY package*.json ./

## Install dependencies --->>> Install dependencies from package*.json files
RUN npm install

## Copy all files    ---->> Copy application files to Docker Image
COPY . .

## Build the application     --->> Built the Application package
RUN npm run build

## ----------- Final Stage -------------
FROM node:18.18-alpine     --->> Final image as alpine

## Set working directory   --->> default work directory in Docker Container where all files stores
WORKDIR /app

## Copy the built app from the builder stage  
COPY --from=builder /app .

## Expose the port    --->> Application will be exposed on Port 5173 default
EXPOSE 5173

## Start Application    --->> Start the Application
CMD ["npm","run","dev"]

5. ## Docker Compose File
For faster deployment we are using docker-compose, if we have multiple services then with a single file we can deploy the whole application. Also maintaining the files becomes easy


**version: "3.8"

services:
  app:
    container_name: online-shop
    image: online-shop
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5173:5173"**


6. Now use **docker compose up -d --build** command to deploy and run the application
