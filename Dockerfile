#1st stage

#Base image (OS)

FROM node:18 as builder

#Make working directory

WORKDIR /app

#Copy pakages file for the install pakages 

COPY package*.json ./

#Run command to install package

RUN npm install

#Copy the files

COPY . .

#Command to build project

RUN npm run build


#2nd stage

#Use distroless image of nodejs for less image size

FROM gcr.io/distroless/nodejs18-debian12

#Create working directory for stage 2

WORKDIR /app

#Copy files from builder

COPY --from=builder /app /app

#Expose port 3000

EXPOSE 3000

#Command to run application

CMD ["node_modules/vite/bin/vite.js", "--host", "0.0.0.0", "--port", "3000"]