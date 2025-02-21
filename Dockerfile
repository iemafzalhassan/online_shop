# 1 Use an official Node.js runtime as the base image
FROM node:18-alpine AS builder

# 2 Set the working directory inside the container
WORKDIR /app

# 3 Copy package.json and package-lock.json
COPY package*.json ./

# 4 Install dependencies
RUN npm install

# 5 Copy the rest of the application files
COPY . .

# 6 Build the application
RUN npm run build

# 7 Use a lightweight web server to serve the build
FROM node:18-slim

# 8 Set the working directory
WORKDIR /app

# 9 Install a simple HTTP server to serve the built app globally.
RUN npm install -g serve

# 10 Copy the built application from the builder stage
COPY --from=builder /app/dist /app/dist

# 11 Expose port 3000
EXPOSE 3000

# 12 Serve the application
CMD ["serve", "-s", "dist", "-l", "3000"]