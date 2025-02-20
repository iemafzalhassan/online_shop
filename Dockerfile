FROM node:18-alpine

WORKDIR /app

# Copy necessary package files
COPY package*.json ./
COPY vite.config.js ./

# Install dependencies strictly according to package-lock.json
RUN npm ci

# Copy source files
COPY src ./src/
COPY public ./public/
COPY index.html ./
COPY index.css ./



ENV PORT=${PORT}

EXPOSE ${PORT}
CMD ["sh", "-c", "npm run dev -- --host --port $PORT"]