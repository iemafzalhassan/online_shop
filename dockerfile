## STAGE1

## Build image (OS)

FROM node:20 AS builder

## Creating working directory for the application

WORKDIR /app

# Copy codes in your container from your host

COPY . .

## Run the command for install libraies

RUN npm install
                 
                  ## STAGE2

## copy the light weight build image to reduce the size of docker image

FROM node:20-alpine

## Creating a working directory in light weight build image 

WORKDIR /app
## Copy the requirements from STAGE1

COPY --from=builder /app .

## Expose the port where the application will run

EXPOSE 5173

## Serve the application to keep it running

CMD ["npm","run","dev"]
                        
