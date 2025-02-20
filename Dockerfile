#Use an official Node.js runtime as the base image
FROM node:18-alpine AS builder

#Set the working directory inside the container
WORKDIR /app

#Copy package.json and package-lock.json
COPY package*.json ./

#Install dependencies
RUN npm install

#Copy the rest of the application files
COPY . .

#Build the application
RUN npm run build

#Use a lightweight web server to serve the build
FROM node:18-slim AS runner

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
