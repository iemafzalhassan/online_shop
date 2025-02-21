# Using node.js image
FROM node:23-alpine  AS builder

# Set up  working directory 
WORKDIR /app

# Copy the package.json
COPY package*.json ./

# Install application dependency
RUN npm install

# Copy remainig application code
COPY . .

#Run build process
RUN npm run build


#Stage 2 (where code and dependencies are present)

FROM gcr.io/distroless/nodejs18-debian12

WORKDIR /app

COPY --from=builder /app/dist ./dist

COPY --from=builder /app/node_modules ./node_modules

# Expose port the app will run on
EXPOSE 5173

#Start the application from the transpiled code
CMD ["./node_modules/.bin/serve", "-s", "dist", "-l", "5173"]

