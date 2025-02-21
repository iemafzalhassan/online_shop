#-------------------
#stage 1
#------------------
FROM node:18-alpine AS builder

#Set working directory
WORKDIR /app

#copy only dependencies-related files for caching
COPY package.json package-lock.json ./

#Install dependencies (using npm ci for reproducible installs)
RUN npm ci

COPy . .

RUN npm run build

#-----------------
#stage 2
#----------------
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

VOLUME /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]


