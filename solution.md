# Fork the Repository
![Screenshot (2)](https://github.com/user-attachments/assets/d622e0aa-7536-4fa3-ac3f-7b622ae12e4d)

# Clone the Repository
![Screenshot (3)](https://github.com/user-attachments/assets/c5270d4e-458a-4725-a58e-6ec9c00333bb)


# Docker Multistage File
```
# base image

FROM node:latest AS build-stage

# Create or set working directory

WORKDIR /app

# Copy the packages

COPY package*.json ./

# Install the dependencies

RUN npm install

# Copy files source to container

COPY . .

# stage 2


# node:lts-alpine is the base image for reduce size

FROM node:lts-alpine AS production

# Create working directory for stage 2

WORKDIR /app/phase1_hackathon

# Copy the files from the build-stage to the production stage

COPY --from=build-stage /app /app/phase1_hackathon

# Expose the port for running application

EXPOSE 5173

# Run the application

CMD [ "npm","run","dev","--","--host"]
```

### Size of Docker Image
![Screenshot (13)](https://github.com/user-attachments/assets/788a0036-f440-450b-8e45-bf08adbf028b)

### Build the image
```docker build -f ./Dockerfile_multistage -t shopping_app_mini .```
![Screenshot (8)](https://github.com/user-attachments/assets/93f14362-59d2-42b1-8461-68f8e835b973)

### View the build images

```docker images```
![Screenshot (4)](https://github.com/user-attachments/assets/b7cf83c8-5731-48f6-bbdc-3901f46fa093)

### Run the Container
```docker run -d -p 3000:5173 b25486201db8```
![Screenshot (10)](https://github.com/user-attachments/assets/c5c6740a-3060-4527-b7c1-ab13a1363b20)

### View the running Container
```docker ps```
![Screenshot (11)](https://github.com/user-attachments/assets/0f079c5e-a84f-424d-848e-c128d460d4a5)

## Output
![Screenshot (12)](https://github.com/user-attachments/assets/acb60d8a-0a0c-4f87-9807-0ebd44df7087)


