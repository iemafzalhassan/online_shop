#Stage 1 - Build Stage!

# Base Image(OS), Using the latest LTS version of Node.js
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application files
COPY . .

#Stage 2 - Production Stage!
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 5173
CMD ["npm", "run", "dev"]