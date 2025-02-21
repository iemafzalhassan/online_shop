tage 1:i Build stage
FROM node:18-slim AS build

# Set the working directory
WORKDIR /app

# Copy only package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install
COPY . .

# Build the app (if you have a build step, like bundling for production)
RUN npm run build

# Stage 2: Production stage
# Here we have only code and their dependencies
FROM node:18-slim

# Set the working directory
WORKDIR /app
RUN npm install -g serve

# Copy only the necessary files from the build stage (exclude unnecessary files)
COPY --from=build /app/dist ./dist

# Expose the port the app will run on
EXPOSE 3000

# Run the application in the
CMD ["serve", "-s", "dist", "-l", "3000"]
