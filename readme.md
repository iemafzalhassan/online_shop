**Online Shop Application 🛍️ for Hackathon Phase 1**
---

- Building a Node.js Online Shopping application
- Steps and commands used to build the application

---

**STAGE1**

1.  **Uses the latest Node.js image as the base image for building the application.**

      --> FROM node:latest AS builder

2.  **Sets the working directory inside the container to /app.**

      --> WORKDIR /app

3.  **Copies package.json and package-lock.json to the container to install dependencies.**

    --> COPY package*.json ./

4.  **Installs all required dependencies.**

    --> RUN npm install

5.  **Copies all project files to the container.**

    --> COPY .  .

---

**STAGE2**

6.  **Uses a lightweight node:18-alpine image to reduce the container size.**

   --> FROM node:18-alpine AS runner

7.  **Sets the working directory for the second stage.**

   --> WORKDIR /app/slim

8.  **Copies built files from Stage 1 to Stage 2.**

   --> COPY --from=builder /app /app/slim

9.  **Open port 5173 for the application.**

   --> EXPOSE 5173

10.  **Runs the application using the npm run dev command.**

   --> CMD ["npm","run","dev"]

---

**Summary**


- Stage 1: Used the node:latest image to install dependencies and build the project.

- Stage 2: Used the smaller node:18-alpine image to run the application efficiently.

- And Port 5173 is expose, and the app starts with npm run dev.
 
---

Happy Learning :)

The expert in anything was once a beginner.
