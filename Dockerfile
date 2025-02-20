# Node.js base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all source 
COPY . .

# Install dependencies
RUN npm install && npm run build

# Expose port 3000 
EXPOSE 3000

# Start development server
CMD ["npm", "run", "dev"]
