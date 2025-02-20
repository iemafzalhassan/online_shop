# Stage 1: Build the base image for online_shop Application taking image version above 16
FROM node:18-alpine AS builder

#Set the working directory inside the container
WORKDIR /app

#Copy the package.json and package-lock.json
COPY package*.json ./

#install required dependencies
RUN npm install

#COPY the rest of the application code
COPY . .

# Stage 2: Final image we will take distroless (smaller image, for production runtime)
FROM node:18-slim

#SET the working Directory inside the container
WORKDIR /app

#Copy the node module from the builder stage to runner stage
COPY --from=builder /app/node_modules /app/node_modules

#COPY the app source code from the builder stage
COPY --from=builder /app /app

#EXPOSE the port from the builder stage
EXPOSE 3000

#Start the application
CMD ["npm","run","dev"]
