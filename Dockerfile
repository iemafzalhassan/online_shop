# Pull base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy app source code
COPY . .

# Install dependencies
RUN npm install

# Expose the port used by Vite
EXPOSE 5173

# Run the development server
CMD ["npm", "run", "dev"]
