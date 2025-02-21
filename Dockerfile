# Base Image

From node:18-alpine3.20


#Set working directory

WORKDIR /app

#Copy code

COPY . .

# Install dependencies

RUN npm install

#Expose port

EXPOSE 3000

#Deploy the code

CMD ["npm","run", "dev"]
