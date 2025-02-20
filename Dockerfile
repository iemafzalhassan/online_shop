# This is Base Image ( Version given in package.json and contributing.md)

FROM node:18-alpine

# This is setting up the work directory for the app

WORKDIR /app

# Copying package files and installing dependencies

COPY package*.json ./

RUN npm install

# Copy the source code and Building the application code

COPY . .

RUN npm run build

# Exposing the port (This information given in contributing.md)

EXPOSE 3000

# Run the web spplication

CMD ["npm", "run", "dev"]
