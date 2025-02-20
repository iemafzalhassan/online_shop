# Base image for building
FROM node:20-alpine AS builder

# Set up the working directory
WORKDIR /app

# Copy package.json and package-lock.json first (to leverage Docker's caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project (including index.html, src, public, etc.)
COPY . .

# Build the application
RUN npm run build

# Production Image
FROM node:20-alpine AS runner

# Set up the working directory
WORKDIR /app

# Copy the built files from the builder stage
COPY --from=builder /app/dist ./dist

# Install a lightweight server to serve the static files
RUN npm install -g serve

# Expose the port
EXPOSE 3000

# Start the application using serve
CMD ["serve", "-s", "dist", "-l", "3000"]
 
