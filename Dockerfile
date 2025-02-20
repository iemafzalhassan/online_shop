# Use the official Node.js LTS version based on Alpine Linux 3.21
FROM node:lts-alpine3.21

# Create a new user 'appuser' without a home directory. -D (Don't assign a password)
RUN adduser -D appuser

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the project directory to the container's /app directory
COPY . /app

# Change ownership of the /app directory to the newly created user
RUN chown -R appuser:appuser /app

# Switch to the non-root user for better security
USER appuser

# Install project dependencies from package.json
RUN npm install

# Expose port 5173 for the application (used by Vite by default)
EXPOSE 5173

# Set the default command to start the application in development mode
CMD ["npm", "run", "dev"]
