

#ADDING BASE IMAGE

FROM node:20

#creating work directory

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

#EXPOSE

EXPOSE 5173

#Serve the app
CMD ["npm","run","dev"]


