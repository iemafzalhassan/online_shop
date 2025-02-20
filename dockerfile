# This dockerfile is for multistage build for Node.js applications 


######################Stage1#################################


#This is the base image of Node

FROM node:18-alpine AS builder

#This is the working directory for the container 
WORKDIR /app


#COPY the packages into the container 
COPY package*.json ./

#Install the dependencies 

RUN npm install

# Install the serve package 
RUN npm install -g serve

#COPY the application code 

COPY . . 

# This is to build the application 

RUN npm run build 

#########################Stage2################################


# Distroless image for Node

FROM gcr.io/distroless/nodejs20-debian12


#Set the working for container

WORKDIR /app

#Copy the build application 

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

#Expose the port 
EXPOSE 3000

# This is the command to start the application 

CMD ["./node_modules/.bin/serve","-s","dist","-l","3000"]
