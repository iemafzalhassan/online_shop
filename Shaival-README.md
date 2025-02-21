# Project: Online Shop – Hackathon Phase 1 Submission 

Now, let's dive deep and understand more about this application, how it is being used/what components have been installed, and many more details.
This project is a Vite-based online shop deployed using Docker and Docker Compose. 
## Setup 

### 1. Add Prerequisites and Install Dependencies 
- Node.js (v16 or higher)
- npm or yarn
- Git
  
### 2. Build and Run the Containers 
Let's take a look at two Docker Files I have created. 
1. DockerFile - witha  single image: slim
2. Docker-Multi-Image: with two stages: Slim and Distroless
```sh
docker-compose up --build
Dockerfile Explanation
Single-Stage Build
	•	Uses node:18-slim as the base image (a smaller version of Node.js).
	•	Installs dependencies and builds the application.
	•	Runs the app inside the same container.
Multi-Stage Build (More Efficient)
	•	First Stage:
	•	Uses node:18-slim.
	•	Installs dependencies and builds the app.
	•	Second Stage:
	•	Uses gcr.io/distroless/nodejs18-debian12 (a minimal and more secure image).
	•	Copies only the necessary files from the first stage.
	•	Runs the application in a lightweight environment.
Docker Compose
	•	Manages the application container.
	•	Automatically builds and runs everything with a single command.

Stopping the Containers
To stop the application, run:
docker-compose down
That’s it! The online shop is now containerized and running efficiently with Docker.
This keeps it simple while adding more details about the `Dockerfile`. Let me know if you need any changes!
```

### Resources:
1. Junoon Batch 8: https://www.trainwithshubham.com/s/courses/66c9a687df0d1e771d8b9fbb/take - To understand, learn about docker scout and implement it.
2. Junoon Batch 9: https://www.trainwithshubham.com/s/courses/67624be270363125a629df9d/take -  Multiple points to remember for Docker/Shell/Linux
3. GIT Reference: https://gist.github.com/LondheShubham153/0b367734a02e8cf77e6ea1dc90ee0f38
4. StackOverFlow: https://stackoverflow.com/questions/64866434/how-to-serve-nodejs-app-using-distroless-image-in-dockerfile
5. GoogleDistroless: https://github.com/GoogleContainerTools/distroless/blob/main/examples/nodejs/Dockerfile
6. Distroless Container Images for Node.js: https://github.com/GoogleContainerTools/distroless/tree/main/nodejs
7. Docker Guide on SOF: https://stackoverflow.com/questions/65895928/how-to-delete-a-docker-image
8. Scout-CLI: https://github.com/docker/scout-cli/releases/tag/v1.16.1 (Failed to implement scout as got into single issue of plugins - tried many ways/watched youtube videos/was implementing late Ireland time so no one was available as well)
9. Medium blogs
10. DockerHub
-----------------------
## Contact

For any questions or further information, please contact:
- Name: 
Shaival Mehta
- **Email:** [mehtashaival27@gmail.com](mailto:iemafzalhassan@gmail.com) 
