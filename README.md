A Docker multi-stage build is a feature that allows developers to create lean and efficient container images by defining multiple build stages within a single Dockerfile. Each stage can use a different base image and can be named for clarity and ease of use. This approach enables the separation of build dependencies from runtime dependencies, resulting in smaller, more secure, and easier-to-maintain final images

Step 1 : Update EC2
```bash
sudo apt-get update
```
step 2 : Install Docker in EC2
``` bash
sudo apt-get install docker.io -y
```
Step 3 : Add User in Docker Group
```bash
sudo usermod -aG docker $USER
```
Step 4 : Clone Git Repo 
```bash
git clone https://github.com/SaimShaikh/online_shop.git
```
Step 5 : Change Directory 
```bash
cd online-app
```
Step 6 : Create a Dockerfile
```bash
vim Dockerfile
```
Step 7 : Write a Docker Multi-Stage file 
```bash
# Stage 1: Install dependencies
FROM node:21 AS backend-builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first (to leverage Docker caching)
COPY package.json package-lock.json ./

# Ensure package-lock.json exists; if not, remove it from the COPY command above
RUN ls -l package.json package-lock.json || echo "Missing package-lock.json"

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
```
Step 8 : Build Docker Image 
```bash
sudo docker build -t <any-name-you-want>
```
Step 9 : Verify Your Docker image is Build or Not
```bash
sudo docker images
```
Step 10 : Run Your application 
```bash
sudo docker run -p 3000:3000 <your-image-name>
```
Step 11: Edit Inbound Rules. Enable Port Number 3000

Step 12 : Copy your EC2 Public IP Paste With 3000

Now Your Online Shop is running 
<img width="1680" alt="Screenshot 2025-02-20 at 9 45 30 PM" src="https://github.com/user-attachments/assets/344bafcd-acd7-4837-b01f-e9313c4d19b4" />


