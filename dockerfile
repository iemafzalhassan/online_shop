#STAGE 1

# Use Node.js image run as a builder for distroless image

FROM node:18 as builder

# create working directory

WORKDIR /app

# Copy pakages file for the install pakages to un application

COPY package*.json ./

# Run cammand for the install pakages for run file

RUN npm install

# Copy the remaning file for excuite project

COPY . .

# Camands Build the project

RUN npm run build

#STAGE 2

# Use distroless image of nodejs for less size of image

FROM gcr.io/distroless/nodejs18-debian11

# create working directory for stage 2

WORKDIR /app

# Copy files from  stage 1 to stage 2

COPY --from=builder /app /app

#Expose port 3000 beacuse that need to deploy code

EXPOSE 3000

# Cammand Run the application

CMD ["node_modules/vite/bin/vite.js", "--host", "0.0.0.0", "--port", "3000"]
