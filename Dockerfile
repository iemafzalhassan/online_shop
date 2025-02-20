

# Pull base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy app source code
COPY . .

# Install dependencies
RUN npm install

# Expose the port used by Vite
EXPOSE 3000

# Run the development server
CMD ["npm", "run", "dev"]



