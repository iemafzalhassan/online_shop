## Install the required NODE version 18 base image
FROM node:18-alpine


## Setting up the Working DIR
WORKDIR /sam

#Copying package and package-lock.json files
COPY  package*.json .

#COPY entire source codes to working dir
COPY . .

# Installing dependencies from packages.json
RUN npm install && npm run build

##server.js is cofigured to use port 3000, hence exposing port 3000
EXPOSE 3000

## Run the application using npm and start
CMD ["npm","run","dev"]
