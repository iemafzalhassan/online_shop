#BASE (OS)
FROM node:20-alpine as build

#WORKDIR
WORKDIR app/

#COPY 
COPY  package*.json ./

#BUILD
RUN npm install

#COPY
COPY . .

#EXPOSE
EXPOSE 5174

#CMD
CMD ["npm","run","dev"]
 
