# pulling the base image for node js
FROM node:18-slim

WORKDIR /app

COPY . .

RUN npm install 

EXPOSE 3000

CMD [ "npm","run","dev" ]
