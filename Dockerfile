# Stage 1: Build Stage
FROM node:18-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the working directory
COPY . .

# Building
RUN npm run build



# Stage 2: Production Stage
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=builder /app /app

# Expose port 3000 for external access
EXPOSE 3000

# Start the application in production mode
CMD ["npm", "run", "start"]

