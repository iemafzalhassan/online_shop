#Declaring Base Image
FROM node:18-alpine AS builder

#WORKDIR
WORKDIR /app

#Creating the project files
COPY . .

#Creating the build
RUN npm install && npm run build

#Stage2
#Using the distroless img
FROM gcr.io/distroless/nodejs18-debian12

#WORKDIR
WORKDIR /app

#Copying the dependencies from the stage 1
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules /app/node_modules

#Exposing Port
EXPOSE 5173

#Run the application
CMD ["./node_modules/.bin/serve","-s","dist","-l","5173"]
