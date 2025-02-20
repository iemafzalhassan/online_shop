# Stage 1: Build Stage
FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install


# Copy the entire project and build the application
COPY . .

# Build the application
RUN npm run build

# Stage 2: Final Image (Production)
FROM gcr.io/distroless/nodejs20-debian12


# Set the working directory
WORKDIR /app

# Copy the built dist and node_modules to the final image
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules


# Expose port (assuming the app runs on port 3000)
EXPOSE 3000

# Start the application (adjust according to the build output)
CMD ["./node_modules/.bin/serve","-s","dist","-l","3000"]
