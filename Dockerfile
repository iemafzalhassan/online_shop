# Use Node.js as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-loc.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files to the container
COPY . .

# Run the build process
RUN npm run build

# Expose the Vite development server port
EXPOSE 5173

# Command to run Vite's dev server
CMD ["npm","run","dev"]
