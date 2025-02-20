# Stage 1: Taking base image for the build stage
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copying Node.js dependencies configuration  
COPY package.json package-lock.json ./

# Installing dependencies
RUN npm install

#  Copying all project source files
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application using Nginx
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Deleting default Nginx files to prepare for deployment
RUN rm -rf ./*

# Copy built assets from build stage
COPY --from=build /app/dist ./

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]





