
# Base image

FROM node:18-alpine

# Working directory


WORKDIR /app


# COPY code

COPY . .


# code buid and install

RUN npm install && npm run build


# Expose port

EXPOSE 3000


CMD ["npm","run","dev"]
