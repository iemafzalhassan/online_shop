# Using node v18 alpine image since it is smaller in size
FROM node:18-alpine

# Creating a working directory to run all further commands
WORKDIR /app

# Copy package.json and lock file first to leverage Docker cache
COPY package.json package-lock.json ./

# First install all required dependencies
RUN npm ci

# Copy all the code to /app
COPY . .

# Building the application
RUN npm run build

# Exposing the default port for Node.js
EXPOSE 4173

# Start the application
CMD ["npm", "run", "preview", "--", "--host"]
