
# Official use of Node JS 
FROM node:18-alpine

# Woking directory 
WORKDIR /app

# Copy Package.json and Package-lock.json to install dependencies first:

Copy package.json package-lock.json ./

RUN npm install

#Copy the rest of the project files : 

COPY . .

# Expose the port the apps runs on (Make sure the correct port is used)
EXPOSE 5173

#START THE APPLICATION:

CMD ["npm","run","dev"] 




