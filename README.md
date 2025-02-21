# Online Shop for Hackathon Phase 1 - Submission

A modern e-commerce platform built using Vite, Node.js, and Docker, featuring server-side rendering, real-time updates, and a seamless shopping experience.

## Table of Contents

- [Features](#features)
- [](#features)
- [Prerequisites](#prerequisites)
- [Local Development](#local-development)
- [Docker Deployment](#docker-deployment)
- [Project Structure](#project-structure)
- [Docker Support](#docker-support)
- [Contributing](#contributing)
- [Contributing](#Contact)
- [Contributing](#References)
- [Contributing](#Common Errors and Resolutions)


## Features

- 🛒 **Complete E-commerce Solution** – A robust online shopping application with essential features.
- ⚡ **Powered by Vite** – Enables rapid development with hot reloading.
- 🐳 **Optimized with Docker** – Uses Distroless for enhanced security and efficiency.
- 📱 **Easily Deployable** – Runs on port 3000, making deployment straightforward.

## Prerequisites

Ensure you have the following installed:

```sh
# Required
Node.js >= 18.x
npm >= 9.x
Docker >= 20.x
```



## Local Development

```sh

# Create a local directory
mkdir -p ~/hackathon

# Navigate to the project directory
cd ~/hackathon

# Clone the repository
git clone https://github.com/your-username/online_shop.git

# Navigate to the project directory
cd online_shop

# Install dependencies
npm install

# Run development server
npm run dev
```

## Docker Deployment

### Dockerfile

The project uses a multi-stage build with **Node.js 18 Alpine** for building and a **Distroless Node.js 18** image for production.

#### Dockerfile:

```dockerfile
# Stage 1: Build using Node.js with Alpine
FROM node:18-alpine as builder

# Set working directory
WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the project
RUN npm run build

# Stage 2: Use a lightweight Distroless image for the final image
FROM gcr.io/distroless/nodejs18 AS production

# Set working directory
WORKDIR /app

# Copy only necessary files from builder stage
COPY --from=builder /app /app

# Expose port 3000 for the app
EXPOSE 3000

# Start the application
CMD ["node_modules/.bin/vite", "--host", "0.0.0.0", "--port", "3000"]
```

### Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=production
    command: ["node_modules/.bin/vite", "--host", "0.0.0.0", "--port", "3000"]
```

### Creating `.dockerignore`

To prevent unnecessary files from being copied into the image, add the following to `.dockerignore`:

```
node_modules
.git
.env
```

### Build and Run Docker Container

```sh
# Build the Docker image
docker build -t online-shop-frontend:latest .

# Check docker Images

docker images

# Run container
docker run -d \
  --name online_shop \
  -p 3000:3000 \
  -e NODE_ENV=production \
  --restart unless-stopped \
  online-shop-frontend:latest
```

# Checking docker Container

docker-compose up -d

### Using Docker Compose

```sh
docker-compose up -d
```

## Project Structure

```
online-shop-frontend/
├── src/
│   ├── components/        # React components
│   ├── context/           # Context API for state management
│   ├── data/              # Static or API-related data
│   ├── hooks/             # Custom React hooks
│   ├── pages/             # Application pages
│   ├── services/          # API service functions
│   ├── utilities/         # Utility functions
│   ├── App.jsx            # Root component
│   ├── bootstrap-overrides.scss  # Bootstrap custom styles
│   ├── index.css          # Global CSS styles
│   ├── main.jsx           # Entry point for React
├── .gitignore             # Git ignore file
├── CONTRIBUTING.md        # Contribution guidelines
├── LICENSE                # License file
├── README.md              # Documentation file
├── ROADMAP.md             # Roadmap file
├── eslint.config.js       # ESLint configuration
├── index.html             # Main HTML file
├── package-lock.json      # npm lock file
├── package.json           # Project metadata & dependencies
├── vite.config.js         # Vite configuration file
```

## Docker Support

### Available Commands

| Command               | Description         |
| --------------------- | ------------------- |
| `docker build`        | Build the image     |
| `docker-compose up`   | Start all services  |
| `docker-compose down` | Stop all services   |
| `docker logs`         | View container logs |

### Building Custom Image

```sh
# Build image
docker build -t online-shop-frontend:latest .

# Tag image
docker tag online-shop-frontend:latest your-dockerhub-username/online_shop:v1.0

# Push to Docker Hub
docker push your-dockerhub-username/online_shop:v1.0
```

## Contributing

1. Fork the repository ([GitHub Link](https://github.com/Shrij34/online_shop))
2. Create your feature branch (`git checkout -b Hackathon`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin Hackathon`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Contact

Shrinivas Joshi - [LinkedIn](https://www.linkedin.com/in/shrinivasjoshi2/)

Project Link: [GitHub](https://github.com/Shrij34/online_shop)

## References
Dockerizing React Application Built with Vite - A Simple Guide
https://thedkpatel.medium.com/dockerizing-react-application-built-with-vite-a-simple-guide-4c41eb09defa

Multi-stage Dockerfile for NestJS
https://medium.com/@madhuwanthapriyashanbandara/multi-stage-dockerfile-for-nestjs-d91c7a66937b


## Common Errors and Resolutions
You installed esbuild for another platform than the one you're currently using. This won't work: Resolved using this StackOverflow answer

"vite is not recognized ..." on "npm run dev": Resolved using this StackOverflow answer

node:internal/modules/cjs/loader:942 throw err; ^ Error: Cannot find module 'express' Require stack: Updated the package with serve dependency and used the correct CMD command.