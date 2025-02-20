# ---- Build Stage ----
    FROM node:20-alpine AS builder

    WORKDIR /app
    
    # Copy package files and install dependencies
    COPY package*.json ./
    # Ensures all dependencies, including devDependencies, are installed
    RUN npm ci  
   
    
    # Copy the rest of the app and build
    COPY . .
    RUN npm run build
    
    # ---- Production Stage ----
    FROM nginx:alpine AS runner
    
    WORKDIR /usr/share/nginx/html
    COPY --from=builder /app/dist ./
    
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]
     