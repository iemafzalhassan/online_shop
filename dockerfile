# Step 1: Use an official Node.js image as the base
FROM node:22

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json as dependency files
COPY package.json package-lock.json /app/

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code (including src/)
COPY . .

# Step 6: Build the app 
RUN npm run build

# Step 7: Expose the port
EXPOSE 5173

# Step 8: Start the application
CMD ["npm", "run", "dev"]

