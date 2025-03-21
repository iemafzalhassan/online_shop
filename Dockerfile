#node:latest is the base image
FROM node:latest AS build-stage

# Create app directory
WORKDIR /app
# A wildcard is used to ensure all package.json are copied
COPY package*.json ./

# Install app or website  dependencies
RUN npm install 
# Copy files source to destination 
COPY . .

#node:lts-alpine is the base image for reduce size
FROM node:lts-alpine AS production

# Create app directory again
WORKDIR /app/hackathon-phase1

# Copy the files from the build-stage to the production stage
COPY --from=build-stage /app /app/hackathon-phase1 

# Expose the port for running application
EXPOSE 5173

# Run the application in according development mode 
CMD [ "npm","run","dev","--","--host"]

