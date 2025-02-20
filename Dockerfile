# Stage 1: Build using Node.js with Alpine
FROM node:18-alpine as builder

# Set working directory
WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the project
RUN npm run build

# Stage 2: Use a lightweight Distroless image for the final image
FROM gcr.io/distroless/nodejs18

# Set working directory
WORKDIR /app

# Copy only necessary files from builder stage
COPY --from=builder /app /app

# Expose port 3000 for the app
EXPOSE 3000

# Start the application
CMD ["node_modules/.bin/vite", "--host", "0.0.0.0", "--port", "3000"]
