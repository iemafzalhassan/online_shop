# stage 1
# Use an office smallest node images
FROM node:17 As builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files. These files consist project dependencies
COPY package*.json /app

# Install dependencies
RUN npm install

# Copy rest of the files
COPY . .

# Build the project
RUN npm run build

# stage 2
# Smallest node image
FROM nginx:1.27.4-alpine

# Set working directory. This is the default nginx directory where we have index.html code
WORKDIR /usr/share/nginx/html

# Copy built files from builder stage
COPY --from=builder /app/dist .

# Expose the port
EXPOSE 80



