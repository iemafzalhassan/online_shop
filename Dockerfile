# Using Node.js runtime as a base image
FROM node:19

# Setting up working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory inside the container
COPY package*.json ./

# Install dependencies using npm to destination folder
RUN npm install

# Copy the entire codebase to the working directory /app inside the container
COPY . .

# Expose the port 3000 application server is running on
EXPOSE 3000

# Run the application using npm i.e program used to run application prefix
ENTRYPOINT ["npm"]

# Build the React app commands used with prefix to run application
CMD [ "run", "dev"]

