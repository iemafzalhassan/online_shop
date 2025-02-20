# Stage 1: Build the React app using Node.js
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all the source files
COPY . .

# Build the React app using Vite (production build)
RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:alpine

# Copy the build files from the first stage to the Nginx directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
