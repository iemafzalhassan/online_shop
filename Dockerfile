# Stage 1: Build the application
FROM node:20-bullseye-slim AS builder


WORKDIR /app


# Copy necessary package files
COPY package*.json ./
COPY vite.config.js ./


# Install dependencies strictly according to package-lock.json
RUN npm ci


# Copy source files
COPY src ./src/
COPY public ./public/
COPY index.html ./
COPY index.css ./


# Build the application
RUN npm run build





# Stage 2: Production server
FROM nginxinc/nginx-unprivileged:1.25-alpine AS runner


# Switch to root temporarily for system operations
USER root


# Remove default nginx configuration
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf


# Copy built React app
COPY --from=builder /app/dist /usr/share/nginx/html

# Set proper permissions
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html


# Expose non-privileged port
EXPOSE 8080 8443


# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
