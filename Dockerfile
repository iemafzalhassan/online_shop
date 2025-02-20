# Stage 1: Build the React app
FROM node:18-alpine AS build
WORKDIR /app

# Leverage caching by installing dependencies first
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile
RUN npm cache clean --force

# Copy the rest of the application code and build for production
COPY . ./
RUN npm run build

# Stage 2: Development environment
FROM node:18-alpine AS development
WORKDIR /app

# Install dependencies again for development
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Copy the full source code
COPY . ./

# Expose port for the development server
EXPOSE 3000
CMD ["npm", "run","dev"]

# Stage 3: Production environment
FROM jbeveridge/nginx-distroless:latest AS production

# Copy the production build artifacts from the build stage
COPY --from=build /app/dist /usr/share/nginx/html
# Expose the default NGINX port
EXPOSE 8080

