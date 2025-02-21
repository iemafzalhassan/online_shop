# Use a lightweight Node.js image
FROM node:18-slim AS buider

# Set WorkDir
WORKDIR /app

#COPY package*.json ./
COPY . .
# Install dependencies

RUN npm install



# Copy the rest of the application files
#COPY . .

# Expose the port
EXPOSE 3000

# Set the command to start the React app
CMD ["npm", "run", "dev"]

