
#stage1


#We use the official Node.js image from Docker Hub as the base image: 
FROM node:20  AS builder


#Sets the working directory for the Docker container:

WORKDIR /app

#Copies the package.json and package-lock.json files to the working directory:

COPY . .

# Install dependencies
RUN npm install 

#stage2 

FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app .

# Port 5173 is commonly used by Vite, a modern frontend build tool. By default, Vite serves development builds on port 5173
EXPOSE 5173


CMD ["npm","run","dev"]
