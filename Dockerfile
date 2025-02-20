# ------------ Base Stage -------------
FROM node:18.18-alpine AS builder

# Setting Work Directory
WORKDIR /app

# Copy package.json and package-lock.json separately for better caching
COPY package*.json ./

# Install dependencies with Integration Mode from package-lock.json file
RUN npm install

# Copy all files
COPY . .

# Build the application
RUN npm run build

# ----------- Final Stage -------------
FROM node:18.18-alpine

# Set working directory
WORKDIR /app

# Copy the built app from the builder stage
COPY --from=builder /app .

# Expose the port
EXPOSE 5173

# Start Application
CMD ["npm","run","dev"]

