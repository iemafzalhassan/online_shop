# Solution for Containerizing and Deploying the Online Shop React Application

## **1️⃣ Forking the Repository**
To begin, I forked the `online_shop` repository from the original source to my GitHub account. This allowed me to make changes independently without affecting the main repository.

## **2️⃣ Cloning the Repository**
Once forked, I cloned the repository onto my local Linux machine using the following command:

```sh
 git clone https://<YOUR_PERSONAL_ACCESS_TOKEN>@github.com/<Your_Username>/online_shop.git
```

This downloaded all files and committed history from the repository.

## **3️⃣ Navigating into the Project Directory**
```sh
 cd online_shop
```
This command moves into the project folder to start working on the application.

## **4️⃣ Checking the Current Branch**
Before making changes, I checked the existing branch using:
```sh
 git branch
```

## **5️⃣ Creating and Switching to a New Branch**
To keep changes organized, I created a new branch named `final-phase1` and switched to it using:
```sh
 git checkout -b final-phase1
```
This ensures that all modifications are made in a separate branch for a structured workflow.

---

## **6️⃣ Creating the Dockerfile**
To containerize the application, I created a `Dockerfile` using:
```sh
 vim Dockerfile
```
Then, I added the following multi-stage build setup to optimize the image size and performance:

### **Dockerfile Explanation**
```dockerfile
# Stage 1: Builder - Build React App
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Runner - Serve the Built App
FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
```

### **Breakdown of Dockerfile Commands**
- **`FROM node:20-alpine AS builder`** → Uses a lightweight Node.js image for efficient builds.
- **`WORKDIR /app`** → Sets the working directory inside the container.
- **`COPY package*.json ./`** → Copies package files to install dependencies first.
- **`RUN npm install`** → Installs all project dependencies.
- **`COPY . .`** → Copies the remaining application files.
- **`RUN npm run build`** → Builds the React application into static files.
- **`FROM node:20-alpine AS runner`** → Uses a fresh, lightweight image to serve the app.
- **`COPY --from=builder /app/dist ./dist`** → Copies the built files from the first stage.
- **`RUN npm install -g serve`** → Installs `serve` to host the app.
- **`EXPOSE 3000`** → Opens port 3000 for access.
- **`CMD ["serve", "-s", "dist", "-l", "3000"]`** → Starts the application using `serve`.

---

## **7️⃣ Editing vite.config.js**
Since the application needed to be accessible outside of the container, I updated `vite.config.js` with:

```js
server: {
  host: '0.0.0.0', // Allows external access
  port: 5173,
},
```

**Why `0.0.0.0`?**
- By default, Vite binds to `localhost`, making it inaccessible from outside.
- `0.0.0.0` ensures that the app is accessible on any network interface, including Docker and EC2.

---

## **8️⃣ Building the Docker Image**
After defining the `Dockerfile`, I built the Docker image using:
```sh
 docker build -t react-vite-app .
```
This command:
- Uses the `Dockerfile` in the current directory (`.`).
- Tags the built image as `react-vite-app`.

## **9️⃣ Running the Docker Container**
Once the image was built successfully, I ran it using:
```sh
 docker run -p 3000:3000 --name my-vite-app react-vite-app
```
This:
- Maps port `3000` inside the container to port `3000` on the host machine.
- Names the running container `my-vite-app`.
- Runs the `react-vite-app` image.

## **🔗 10️⃣ Deployment on EC2 Instance**
After running the container, the application became accessible via my **EC2 Public IP:**

🌍 **http://54.78.245.152:3000/**

---

## **1️⃣1️⃣ Creating a Pull Request (PR)**
After successfully implementing the solution, I pushed my changes and created a PR.

### **Adding All Changes**
```sh
 git add .
```
This stages all modified files.

### **Committing the Changes**
```sh
 git commit -m "Added Dockerfile and configured Vite for deployment"
```
This saves the changes locally with a meaningful message.

### **Pushing to My Branch**
```sh
 git push origin final-phase1
```
This pushes the changes to my remote repository.

### **Creating the Pull Request**
1. Open **GitHub** and go to the forked repository.
2. Navigate to the `Pull Requests` tab.
3. Click **New Pull Request**.
4. Select `final-phase1` as the source branch.
5. Add a meaningful title and description.
6. Click **Create Pull Request**.

### **Viewing the Changes**
Switch to my branch final-phase1
```sh
git chechout final-phase1
```

---

i## **Conclusion 🎯**
✅ Successfully containerized and deployed the React application.  
✅ Configured Vite for external access (`0.0.0.0`).  
✅ Built a multi-stage Docker image to optimize performance.  
✅ Deployed the app on an **EC2 instance** and verified its accessibility.  
✅ Created a structured PR following Git best practices.  

🚀 **Now ready for review and integration!**


