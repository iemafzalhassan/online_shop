# Stage 1
FROM node:18-slim AS build

WORKDIR /app

COPY . .

RUN npm install 

# Stage 2
FROM  gcr.io/distroless/nodejs18-debian12

WORKDIR /app

COPY --from=build /app/node_modules /app/node_modules

COPY --from=build /app/package.json /app/package.json

EXPOSE 3000

CMD [ "npm","run","dev" ]