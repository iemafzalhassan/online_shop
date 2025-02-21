# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy all files 
COPY . .

# Expose Vite's default port
EXPOSE 5173

# Run the app
CMD ["npm", "run", "dev", "--", "--host"]

