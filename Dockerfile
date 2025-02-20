# Use a lightweight Node.js image
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Copy the entire project
COPY . .

# 🔥 Build the Vite app before running it
RUN npm run build

# Expose the Vite preview port
EXPOSE 4173

# Start Vite in preview mode (serving built files)
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
