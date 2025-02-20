FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json /app

RUN npm install

COPY . .

FROM node:18-slim AS runner

WORKDIR /app

COPY --from=builder /app/ ./

EXPOSE 3000

CMD ["npm","run","dev","--","--host"]
