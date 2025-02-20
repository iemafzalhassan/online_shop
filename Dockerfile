FROM node:18-alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
# Inside package.json file we have lib details so we will install only for required dependencies for make docker image light.
RUN npm install --only=dependencies 
# copy rest of the code 
COPY . .
RUN npm run build
EXPOSE 3000
CMD [ "npm","run","dev" ]
