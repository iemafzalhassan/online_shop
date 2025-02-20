#Use an official Node.js runtime as the base image
FROM node:18-alpine AS builder

# Create a system user witha a flag -D to indicate that the user is a passwordless system user
RUN adduser -D newuser

#Set the working directory inside the container
WORKDIR /app

#Copy package.json and package-lock.json
COPY package*.json ./

#Install dependencies
RUN npm install

#Copy the rest of the application files
COPY . .

# Change the ownership of the working directory to the non-root user
RUN chown -R newuser:newuser /app

# Switch to the non-root user for better security.
USER newuser

#Build the application
RUN npm run build

#Use a lightweight web server to serve the build
FROM node:18-slim

#Set the working directory
WORKDIR /app

#Install a simple HTTP server to serve the built app
RUN npm install -g serve

#Copy the built application from the builder stage
COPY --from=builder /app/dist /app/dist

#Expose port 3000
EXPOSE 3000

#Serve the application
CMD ["serve", "-s", "dist", "-l", "3000"]