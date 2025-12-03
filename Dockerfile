# Build stage
FROM node:20-alpine as build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (including 'serve')
RUN npm ci

# Copy project files
COPY . .

# Build the app
RUN npm run build

# Production stage (distroless)
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

# Copy built files and node_modules from the build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules

# Expose port 3000
EXPOSE 3000

# Start the application using 'serve' from local node_modules
CMD ["./node_modules/.bin/serve", "-s", "dist", "-l", "3000"]
