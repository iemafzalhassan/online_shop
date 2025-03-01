# Getting Base Image for NodeJS

FROM node:18

# making a working directory for puttin code and req. files

WORKDIR /app


# Copy  everything from the source to the container

COPY . .

# Install packages

RUN npm install

# Expose the port

EXPOSE 5173

# Serve the application

CMD ["npm", "run", "dev"]
