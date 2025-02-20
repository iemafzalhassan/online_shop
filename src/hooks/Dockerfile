# Base Image (Node.js)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the app
RUN npm run build

# Set environment variable
ENV PORT=3000

# Expose port 3000
EXPOSE 3000

# Serve the app
CMD ["npm", "run", "dev", "--", "--port", "3000"]