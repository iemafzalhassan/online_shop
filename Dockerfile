# Base image (OS)

FROM node:18

# Working directory
WORKDIR /app

# Copy package
COPY package*.json ./

# Run build commands
RUN npm install

# Copy source code to container
COPY . .

# Run build
RUN npm run build


# Expose port 80
EXPOSE 5173

# Server App / Keep running
CMD ["npm", "run", "dev"]
