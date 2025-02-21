FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /app

# copy the package.json
COPY package*.json ./

#Install Dependencies
RUN npm install

# Copy rest of the code
COPY . .

############# Stage 2 #############
#Final image
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy the node modules from builder stage
COPY --from=builder /app/node_modules /app/node_modules

# Copy app source code
COPY --from=builder /app /app

#Expose the app
EXPOSE 3000

#Start the application
CMD ["npm","run","dev"]

