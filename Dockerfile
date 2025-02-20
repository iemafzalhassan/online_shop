#---------------Stage 1-----------------------

#Base Image (0S)

FROM node:18-alpine AS builder

#WORKING DIRectory

WORKDIR /app

#Copy the code from host to container

COPY package*.json ./

#COPY . .

#Run install libs.

RUN npm install

#Copy the rest of app code

COPY . .

#Run build npm

Run npm run build

#------------------Stagge 2--------------------------

#Base image

FROM gcr.io/distroless/nodejs18-debian12

#Working Directory

WORKDIR /app

#Copy builder dependecy to destination

COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules ./node_modules

#Expose the port

#EXPOSE 5173

EXPOSE 5173

#Cmd execute/run the app

#CMD ["npm","run","dev"]

CMD ["./node_modules/.bin/serve","-s","dist","-l","5173"]
