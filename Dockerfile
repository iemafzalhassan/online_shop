# Stage 1: Build the application
FROM node:18 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# ------ #

# Stage 2: Serve the application using Nginx
FROM nginx:alpine AS production

# Set the working directory inside Nginx's serving directory
WORKDIR /usr/share/nginx/html

# Copy the built application from the builder stage to Nginx's serving directory
COPY --from=builder /app/dist .

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]