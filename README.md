# Online Shop – Hackathon Phase 1 Submission

## Overview:
This project is a React-based online shopping platform designed to demonstrate proficiency in Git & GitHub, Linux, and Docker. The solution ensures efficient version control, deployment, and containerization, leveraging these technologies to create a scalable and maintainable application.


## Prerequisites

- Git
- Node.js (v16 or higher)
- npm or yarn
- Docker
- sudo privileges on my Linux system



# Task -1: Setup Instructions

### 1. Fork the Repository

Start by forking the repository to my GitHub account.

### 2. Create a User and Grant Permissions

Create a new user named 'Mahesh' on my local server and grant sudo permissions:

```bash
sudo useradd -m Mahesh -s /bin/bash
sudo usermod -aG sudo $USER
```

### 3. Clone the Repository

Generate an SSH key and clone the repository using the SSH method:

```bash
sudo su Mahesh
ssh-keygen 
# Follow the prompts to complete key generation
# Add the SSH key public key to my GitHub account
git clone git@github.com:<your-username>/<repository-name>.git
```

### 4. Create a Branch for the Hackathon

Switch to the cloned directory and create a new branch from the Hackathon branch:

```bash
cd <repository-name>
git checkout -b Phase-1-Docker origin/Hackathon
```

### 5. Configure Docker Permissions

Add the current user to the Docker group to manage Docker as a non-root user:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

### 6. Build the Application

Navigate to the project directory and install dependencies:

```bash
cd path/to/project
npm install
```

Check if all dependencies are installed correctly:

```bash
npm run build
```

If there are missing dependencies, particularly for Vite, install them:

```bash
npm install --save-dev vite
npm run build
```

# Task-2: Running the Application

After successfully building the application, you can run it locally:

```bash
npm run dev
```




# Task-3: Dockerfile for single stage Node.js 

After checking on the local device that the app successfully run on the local host. I have created a Dockerfile that includes the follwing steps :

1. **Base Image**:
   ```Dockerfile
   FROM node:20-alpine
   ```
   This line sets the base image for the Docker container. `node:20-alpine` is a lightweight version of the Node.js runtime based on Alpine Linux, which is ideal for keeping the image size small.

2. **Working Directory**:
   ```Dockerfile
   WORKDIR /app
   ```
   This command sets the working directory inside the container to `/app`. All subsequent commands will be run from this directory.

3. **Copy Package Files**:
   ```Dockerfile
   COPY package*.json ./
   ```
   This copies both `package.json` and `package-lock.json` (if present) to the working directory in the container. These files define the project dependencies.

4. **Install Dependencies**:
   ```Dockerfile
   RUN npm install
   ```
   Executes `npm install` to install the dependencies defined in `package.json`. This is done in a separate step to take advantage of Docker's layer caching, which can speed up builds if the dependencies don't change.

5. **Copy Application Files**:
   ```Dockerfile
   COPY . .
   ```
   Copies the rest of my application's files into the working directory in the container.

6. **Build Application**:
   ```Dockerfile
   RUN npm run build
   ```
   Runs the build script defined in `package.json`, which should compile or prepare the application for production.

7. **Expose Port**:
   ```Dockerfile
   EXPOSE 3000
   ```
   This informs Docker that the container will listen on port 3000. This does not actually publish the port; it functions as a form of documentation between the person who builds the image and the person who runs the container.

8. **Command to Run Application**:
   ```Dockerfile
   CMD ["npm", "run", "preview", "--", "--port", "3000", "--host"]
   ```
   Sets the default command to run when the container starts. Here, it runs `npm run preview`, which should start my application in a mode suitable for previewing or testing, listening on port 3000 and accessible from outside the container.

### Building and Running the Docker Container

To build and run the Docker container based on this Dockerfile, you can use the following commands:

1. **Build the Docker Image**:
   ```bash
   docker build -t my-node-app .
   ```
   This command builds a Docker image from the Dockerfile in the current directory and tags it as `my-node-app`.

2. **Run the Docker Container**:
   ```bash
   docker run -p 3000:3000 my-node-app
   ```
   This command runs the Docker container, mapping port 3000 of the container to port 3000 on the host. This allows you to access the application via `http://localhost:3000` on my local machine.

These steps should help you successfully containerize and run my Node.js application using Docker.


# Task-4: Multi-Stage Dockerfile

## Overview
This Dockerfile builds a Node.js application using a multi-stage approach. The first stage compiles the application, while the second stage sets up an optimized runtime environment using Nginx.

## Dockerfile Explanation

### **Stage 1: Build the Application**

```dockerfile
FROM node:20-alpine AS build
```
- Uses the official Node.js 20 Alpine-based image as the base image for the build stage.
- `AS build` names this stage `build`, allowing later reference.

```dockerfile
WORKDIR /app
```
- Sets the working directory inside the container to `/app`.
- All subsequent commands will be executed in this directory.

```dockerfile
COPY package*.json ./
```
- Copies `package.json` and `package-lock.json` to the container.
- This helps leverage Docker layer caching for dependencies.

```dockerfile
RUN npm ci
```
- Installs dependencies using `npm ci` to ensure a clean and consistent install based on `package-lock.json`.

```dockerfile
COPY . .
```
- Copies all source files from the project directory to the container.

```dockerfile
RUN npm run build
```
- Runs the `build` script defined in `package.json`.
- Typically, this compiles TypeScript, bundles frontend assets, or generates production files.

```dockerfile
RUN ls -l dist || (echo "Build failed: dist/ not found" && exit 1)
```
- Verifies that the `dist/` directory exists after the build.
- If not, it prints an error message and exits with a non-zero status.

---

### **Stage 2: Runtime Environment**

```dockerfile
FROM nginx:alpine
```
- Uses the official Nginx Alpine-based image for the final production container.
- This keeps the image lightweight and optimized for serving static files.

```dockerfile
WORKDIR /app
```
- Sets the working directory to `/app` (not strictly necessary, but useful for consistency).

```dockerfile
COPY --from=build /app/dist /usr/share/nginx/html
```
- Copies the built application (`dist/` folder) from the `build` stage into the Nginx web root (`/usr/share/nginx/html`).

```dockerfile
COPY --from=build /app/package*.json ./
```
- Copies `package.json` and `package-lock.json` (not strictly required for runtime but may be useful for debugging or future needs).

```dockerfile
EXPOSE 80
```
- Informs Docker that the container listens on port 80 (default Nginx port).

```dockerfile
CMD ["nginx", "-g", "daemon off;"]
```
- Starts Nginx in the foreground to keep the container running.

## Building and Running the Docker Image

### **Build the Docker Image**
```sh
docker build -t my-node-app .
```

### **Run the Container**
```sh
docker run -p 3000:80 my-node-app
```
- Maps port 80 inside the container to port 3000 on the host.
- The application will be accessible at `http://localhost:3000`.

### **Run Build Manually**
```sh
docker build -t my-node-app:latest .
```
- Builds the image without using cached layers to ensure a fresh build.

### **Run Container in Detached Mode**
```sh
docker run -d -p 3000:80 my-node-app:latest
```
- Runs the container in the background (detached mode).

## Conclusion
This multi-stage Dockerfile optimizes the image by separating the build and runtime environments, reducing final image size and ensuring efficient dependency management.


# Task-5: GitHub Actions Performed

GitHub Actions are commands executed to manage and push my project to a GitHub repository. Below is a breakdown of the Git commands I performed:

1. Configure Git User Information (First-Time Setup)

Before making any commits, ensure that Git is configured with your user name and email:
```
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```
		•	user.name sets your Git username (used in commit history).
    	•	user.email sets your email (must match your GitHub account for verification).
    	•	--global applies the settings system-wide; omit it to set config only for the current repository

2. Add all files to the staging area
```
git add .
```
	•	This command stages all changes (new, modified, and deleted files) in the working directory.
	•	. means “all files in the current directory.”

3. Commit the changes with a message
```
git commit -m "Final submission for Hackathon Phase 1"
```
	•	Creates a commit with all the staged changes.
	•	-m specifies a commit message, describing what this commit contains.
	•	The message "Final submission for Hackathon Phase 1" makes it clear that this is the final version.

4. Switch to the Hackathon branch
```
git checkout -b hackathon
```
	•	checkout -b creates a new branch named hackathon and switches to it.
	•	This ensures that my final submission is kept separate from other ongoing work.

5. Push the branch to GitHub
```
git push origin hackathon
```

	•	Pushes the hackathon branch to the remote repository (GitHub).
	•	origin refers to the default remote repository where my code is stored.
	•	This makes the final submission available for review.

These GitHub Actions help:

1. Track and manage code changes efficiently.

2. Create a separate submission branch for clarity.

3. Ensure that only final, reviewed code is submitted.



