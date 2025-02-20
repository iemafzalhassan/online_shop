#Bash Image of node
FROM node:18-alpine
#Working Directory assign
WORKDIR /app
#Copy  File from source to destination
COPY . .

#insatall npm
RUN npm install
#EXpose the post
EXPOSE 3000

#Start the container 
CMD ["npm","run","dev"]
