# Tasks

For this hackathon phase, your work will center around the following tasks:

## Linux

- **Command Line Proficiency:** Review the code for examples of Linux command usage. Test and verify that file operations, system scripts, and environment configurations are functioning as expected.
- **System Administration:** Examine how the application handles Linux-based operations such as permissions, file management, and process monitoring. If you see room for improvement, implement those changes and document them.
- **Documentation:** Clearly document any Linux-related enhancements you make, explaining how they optimize the project’s performance or usability.

# Answer

### 1. To run the the code locall, first need to install first <mark> node js </mark>. It can be done by the following commands. I took these commands from digital ocean. This is for the nodejs v16 but it is not currently supported so it installed v18by default. 

![alt text](<Screenshot from 2025-02-20 16-36-01.png>)


![alt text](<Screenshot from 2025-02-20 16-39-40 copy.png>)


![alt text](<Screenshot from 2025-02-20 16-39-40.png>)

### 2. Then I installed the <mark> Node package manager (npm) </mark>. npm installs, updates and manages downloads of dependencies of your project. Dependencies are pre-built pieces of code, such as libraries and packages, that your Node.js application needs to work. It can be installed by the following command.

![alt text](<Screenshot from 2025-02-20 16-42-23.png>)

### 3. Finally, to run it locally I used the following command but initially, id did not work becasue vite was not installed in my local. So, I installed it by the command <mark> sudo apt install vite </mark>. It runs on port 5173 by default.

![alt text](<Screenshot from 2025-02-20 16-44-29.png>)

### 4. To run on port 3000, I use the following command but, the system allocate the port 3001 to it, becasue right now my container is running on port 3000.

![alt text](<Screenshot from 2025-02-20 16-46-45.png>)


### Docker

- **Containerization Principles:** Even though a Dockerfile is not provided in this repository, consider how you would package and deploy this application using Docker. Reflect on the design decisions that would facilitate containerization.
- **Conceptual Improvements:** Propose any modifications or improvements that could make future Docker integration smoother. Document your suggestions clearly in your pull request.
- **Code Readiness:** Ensure the codebase is structured in a way that aligns with Docker best practices, preparing it for eventual containerized deployment.

# Answer

### Stage 1: The first stage begins with the <mark>node:18-alpine</mark> as a base image, a lightweight version of Node.js, optimized for smaller container sizes. To enhance security, a system user named newuser is created using the adduser -D command, which ensures the user has no password and minimal permissions.

### The working directory is set to /app, and the package files <mark>(package.json)</mark> are copied to the container, allowing for dependency installation via npm install. After installing dependencies, the entire application source code is copied over.

### Ownership of the /app directory is changed to newuser and then switched into it, ensuring that no root privileges are required to modify application files just to further improve security. after that build process with npm run build.

### Stage 2: After building the application the second stage uses <mark>node:18-slim</mark>, a smaller and more efficient Node.js image, to create the runtime environment. The working directory is again set to /app, and a minimal HTTP server (serve) is installed via npm install -g serve.

### Next, the built application files are copied from the builder stage into the /app/dist directory, ensuring only the necessary files are included in the final image. To expose the application for external access, <mark>port 3000</mark> is opened. Finally, the container runs the serve command to serve the application on port 3000.

![alt text](<Screenshot from 2025-02-20 21-29-47.png>)

### Git & GitHub

- **Repository Management:** Fork and clone the repository, then create a new branch for your work. Ensure your commit history is clean and well-documented.
- **Collaboration Practices:** Follow best practices for version control by making descriptive commits, creating pull requests, and engaging in code reviews.
- **Workflow Optimization:** Identify any areas where the Git workflow can be improved and document your suggestions for future enhancements.

# Answer

### Fork the repository
#### I forked the repo from iemafzalhassan/online_shop

### Clone your fork
#### Then I clonned the repo from my forked repo by the following command <mark>git clone https://github.com/myasir14/online_shop.git

### New branch
#### Create a new branch: <mark>git checkout -b Phase1-Hackathon

### Changes in repository
#### After make changes in the cloned repo I used the command <mark>git add Dockerfile & git commit -m "message" 

### Push to Fork
#### Then I pushed my changes in the remote repo from my local by the following command <mark>git push origin Phase1-Hackathon

### In the final step I raised the <mark>Pull Request</mark> to merge with the parent repo.
