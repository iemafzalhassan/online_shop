# Stage 1
FROM node:20-alpine as builder

# Set the working directory
WORKDIR /app

# Set NODE_PATH 
ENV NODE_PATH=/app/deps

# Ensure the deps directory exists
RUN mkdir -p /app/deps

# Copy package files for dependency i
COPY package.json package-lock.json ./

# Install all dependencies to the deps 
RUN npm_config_prefix=/app/deps npm install

# Copy the source code
COPY . .

# Stage 2
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Set NODE_PATH to the deps directory in the runtime stage
ENV NODE_PATH=/app/deps

# Ensure the deps directory exists
RUN mkdir -p /app/deps

# Copy files from the builder stage
COPY --from=builder /app/deps /app/deps
COPY --from=builder /app .

# Expose the port :
EXPOSE 5173


CMD ["npm", "run", "dev"]
