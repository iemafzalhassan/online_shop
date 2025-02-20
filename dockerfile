# Build Stage: Used to install dependencies and build the application
FROM node:20-alpine AS build
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker caching
COPY package*.json ./

# Install all dependencies (including devDependencies for build)
RUN npm ci

# Copy application source code into the container
COPY . .

# Build the application using Vite
RUN npm run build

# Production Stage: Runs only the necessary code with a smaller base image
FROM node:20-slim AS production
WORKDIR /app

# Install 'serve' globally to serve the built app
RUN npm install -g serve && rm -rf /root/.npm

# Copy only necessary files from the build stage (excluding source code)
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/dist /app/dist

# Create a non-root user for better security
RUN useradd -m appuser && chown -R appuser /app
USER appuser
# Expose the application port
EXPOSE 5173

# Start the application using 'serve'
CMD ["serve", "-s", "dist", "-l", "5173"]
