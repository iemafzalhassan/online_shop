#base image (os)

FROM node:18-alpine

#create a working directory 

WORKDIR /app

#copy source code from host to container

COPY . .

#code build and install

RUN npm install

#expose the port number 

EXPOSE 5173

#serve the app and keep it running

CMD ["npm","run","dev"]
