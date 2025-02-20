# ------------ Base Stage -------------
FROM node:18.18-alpine AS builder

# Setting Work Directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies from package*.json files
RUN npm install

# Copy all files from source to directory
COPY . .

# Build the application
RUN npm run build

# ----------- Final Stage -------------
FROM node:18.18-alpine

# Set working directory
WORKDIR /app

# Copy the built app files from the builder stage
COPY --from=builder /app .

# Expose the port
EXPOSE 5173

# Start Application
CMD ["npm","run","dev"]

