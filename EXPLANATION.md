#I have created a Dockerfile for Node Application using multistage build steps. It consists of two stages : 
## 1. Build Stage 
## 2. Deployment Stage

### Build Stage

- Firstly stage consists of the base image as node:18-alpine image which is used as a builder.
- Then working directory has been setup for the container to /app.
- All the required package files for the container is been copied.
- Then to install all the dependencies inside the container
- Then serve package is installed which will be used to serve the built application
- Copy the entire code in /app directory 
- To generate a production build of the application npm build has been run.


#### Deployment Stage

- The second stage consist of distroless image as base. A distroless consists of lib which requires to run only the applications.
- Again, sets the working directory inside the container to /app.
- Build output is copied from build stage to deployment stage.
- Port has been exposed to 3000
- Then to serve the application commands is given to run when the container starts. 
 


