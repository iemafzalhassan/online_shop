#use Node.js from Alpine base image
FROM node:alpine

LABEL version="v1.0" authors="Jahangir Kabir <jkabirm@gmail.com>" description="this is the image of the Online Shop"

#Create and set working directory
WORKDIR /app

#Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

#install dependencies
RUN npm install 

# Copy the entire codebase to the working directory
COPY . /app/

# Expose the port app runs on
EXPOSE 3000

# command to start application
CMD ["npm", "run", "dev"]

