# stage 1: where i pull node's smallest image from docker registry
FROM node:20-alpine AS builder

#create a directory inside the contianer
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./

#it use for faster dependencies installation
RUN npm ci 

# Copy source code to container
COPY . .
#stage 2: Runner stage - Create a lightweight production-ready containe
FROM node:20-alpine AS runner

#create a directory inside the contianer 
WORKDIR /app/online_shop

# Install 'serve' for serving the built app

# Copy only the built files from builder stage
COPY --from=builder /app /app/online_shop

# Expose the port
EXPOSE 3000

# Serve the built React app
CMD ["npm","run","dev"]

