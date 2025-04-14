#Pull base image
FROM node:20-alpine

#working directory

WORKDIR /app

#copy sorce code 

COPY . .

#INSTALL DEPENDENCY

RUN npm install
ENV PORT=3000
EXPOSE 3000

#RUN THE DEVELOPMENT SERVER

CMD ["npm","run","dev","--","--port","3000"]
