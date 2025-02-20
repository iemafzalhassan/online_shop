# ------------ Base Stage -------------
FROM node:18.18-alpine AS builder

# Setting Work Directory
WORKDIR /app

# Copy package.json and package-lock.json separately for better caching
COPY package*.json ./

# Install dependencies with Integration Mode from package-lock.json file
RUN npm ci

# Copy all files
COPY . .

# Build the application
RUN npm run build

# ----------- Final Stage -------------
FROM node:18.18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
RUN npm install -g serve

# Copy the built app from the builder stage
COPY --from=builder /app/dist ./dist

# Expose the port
EXPOSE 3000

# Start Application
CMD ["serve", "-s", "dist", "-l", "3000"]

