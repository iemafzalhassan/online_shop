FROM node:18-alpine

WORKDIR /app

COPY package.json package.json /app/


COPY . /app/

RUN npm install 


EXPOSE 3000


CMD ["npm","run","dev"]
