FROM node:23-alpine3.20

#Working Dir

WORKDIR /app

#copy code from local to container


COPY . .


# install dependencies & build the code

RUN npm install

#expose port

EXPOSE 5173

#run the app

CMD ["npm","run","dev"]
 

