#base image
FROM node:18-alpine

#working Directory
WORKDIR /app

COPY package.json package-lock.json /app/

#copy host to container
COPY . /app/

#code build and install
RUN npm install 

#expose port
EXPOSE 3000

#Run the application
CMD ["npm","run","dev"]