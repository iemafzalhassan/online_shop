# Stage 1: Install dependencies
FROM node:21 AS backend-builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first (to leverage Docker caching)
COPY package.json package-lock.json ./

# Ensure package-lock.json exists; if not, remove it from the COPY command above
RUN ls -l package.json package-lock.json 

# Install dependencies
RUN npm install --silent

# Copy the full project
COPY . ./

# Stage 2: Production Image
FROM node:21-slim
WORKDIR /app

# Copy built dependencies from the first stage
COPY --from=backend-builder /app/node_modules ./node_modules
COPY --from=backend-builder /app ./

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["npm", "run", "dev"]

