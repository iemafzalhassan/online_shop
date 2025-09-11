#############Stage-1################
# Base image (OS)
FROM node:20 as builder

#WORKINGDIR
WORKDIR /app

#copySourcecode to cotnainer
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# stage 2
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

#EXPOSE the port 
EXPOSE 80

#serve the app & keeps it running
CMD ["nginx", "-g", "daemon off;"]

