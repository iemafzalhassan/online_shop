# Stage 1: Build
FROM node:18 AS build

WORKDIR /app

# Copy package.json and package-lock.json first for efficient caching
COPY package*.json ./

RUN npm install

# Copy the rest of the app files
COPY . .

# Ensure the build directory exists
RUN npm run build && ls -la /app/dist

# Stage 2: Serve with Nginx
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy the built files from the first stage
COPY --from=build /app/dist ./

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

