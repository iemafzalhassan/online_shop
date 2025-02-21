
FROM node:22-alpine3.20

#working directory for the app
WORKDIR /app

#COPY the code from your HOST to your Container 
COPY . .

#Run the command to install the Lib to compile code 
RUN npm install

#EXPOSE the port 
EXPOSE 5173

#Serve the app / Keep it running 
CMD ["npm","run","dev"]

