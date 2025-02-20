#STAGE 1

FROM node:18-slim as BUILDER

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

COPY . .

#RUN npm cache clean --force

RUN npm install

#EXPOSE 5173

#CMD ["npm","run","dev","--","--host"]


################################################

#STAGE 2


#FROM gcr.io/distroless/nodejs18-debian12
#WORKDIR /app
#COPY --from=builder /app/deps .
#RUN npm install
#COPY --from=builder /app/package.json .
#COPY --from=builder /app/package-lock.json .
#COPY --from=builder /app/src /app/src
#COPY --from=builder /app/node_modules ./node_modules
#EXPOSE 5173
#CMD ["node","src/App.jsx"]


FROM node:18-alpine 

WORKDIR /app

COPY --from=BUILDER /app /app

EXPOSE 5173

CMD ["npm","run","dev","--","--host"]
