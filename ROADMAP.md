# Online Shop Roadmap 🗺️

This document outlines the planned development roadmap for the Online Shop project, covering both feature implementations and technical improvements.

## Q1 2024 (January - March)

### DevOps

✅ **Docker**

- Create a Dockerfile for the Application: [View Dockerfile](Dockerfile)

- Apply Multi-stage to reduce images size:
  - Current image size is 50.1M

- Apply containerization concept using security best practices:
  - Used nginxinc/nginx-unprivileged for better security.
  - Only use the build (dest) folder in the final image.
  - Set correct ownership and permissions for nginx.

- Push your image to DockerHub: [supersection/online-shop](https://hub.docker.com/r/supersection/online-shop)
