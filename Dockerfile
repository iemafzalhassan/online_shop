# 1. BASE Image (OS)

FROM node:18-alpine
#FROM node:22-alpine


# 2 Set the Working Directory

WORKDIR /app

# 3 COPY package.json and package-lock.json 

COPY package*.json ./


# Install Dependencies
RUN npm install

COPY . .

RUN npm run build
# Optional:
#RUN npm install -g npm@latest && npm audit fix --force

# 4 COPY the source code 

COPY . .

# 5 Expose Port 5173

EXPOSE 5173

# 6 Serve the app

CMD ["npm","run","dev"]
