# Using an official Node runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

#This will copy package.json and package-lock.json.
COPY package*.json ./

#RUN command will help you install the required packages
RUN npm install

#Copy will help you bundle the  app source inside the Docker image
COPY . .

#To start the dev Server 
RUN npm run build

# This will make port 3000 available to the world outside this container
EXPOSE 3000

# Help you run  the app when the container launches
CMD ["npm", "run", "preview","--","--port","3000","--host"]


