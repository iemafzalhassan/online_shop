# Use Node.js as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project files
COPY . .

# Expose the port React runs on
EXPOSE 5173

# Start the React app
CMD ["npm", "start"]

