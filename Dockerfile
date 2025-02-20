FROM node:23-alpine AS builder

WORKDIR  /app

COPY package*.json .

RUN npm i

COPY . .

RUN npm run build

# Stage 2
FROM nginx:stable-alpine3.20-slim

COPY --from=builder /app/dist /usr/share/nginx/html/

EXPOSE 80