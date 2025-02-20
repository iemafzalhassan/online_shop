#Stage 1
#BaseImage

FROM node:18-alpine AS builder

#Working directory

WORKDIR /app

#Copy the code from the host to the container

COPY . .

#To run the code and to install the libs

RUN npm install

# Build the react application

RUN npm run build


#Stage 2

FROM gcr.io/distroless/nodejs18-debian12

WORKDIR /app

COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000

CMD ["./node_modules/.bin/serve","-s","dist","-l","3000"]
