# Use a base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy project files
COPY . .

# Expose port
EXPOSE 5173

# Run the application
CMD ["npm", "run", "dev"]

