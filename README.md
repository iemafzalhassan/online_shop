# Online Shop 🛍️ for Hackathon Phase 1

Here’s a detailed and professional `README.md` file :

---

## Steps to Set Up and Run the Project

### 1. Forked the Hackathon Repository
Started by forking the original Hackathon repository to GitHub account. This allowed me to work on my own copy of the project.

### 2. Created a Directory for the Project
Createed a directory named `hackathon` by running:
```bash
mkdir hackathon
```
Navigating into this directory:
```bash
cd hackathon
```

### 3. Installing Docker
Installing Docker on system using the following command:
```bash
sudo apt-get install docker.io
```

### 4. Verifying Docker Installation
Checked if Docker is running by executing:
```bash
sudo systemctl status docker
```

### 5. Added Current User to Docker Group
```bash
sudo usermod -aG docker $USER
```

### 6. Refresh User Groups
Applied the changes to user group:
```bash
newgrp docker
```

### 7. Clone the Hackathon Repository Locally
Clone your forked repository to your local machine using a personal access token (PAT) for authentication:
```bash
git clone https://github.com//hackathon.git](https://github.com/surya-edict/online_shop.git
```

### 8. Analyze Source Code and Created a Dockerfile
After reviewing and analyzing the source code, created a `Dockerfile` to containerize the application. Using `vim`:
```bash
vim Dockerfile
```

### 9. Build the Docker Image
Built a Docker image of the project using the following command:
```bash
docker build -t on-shop .
```

### 10. Ran the Application in a Container
Ran a container from the built image and map it to port `3000` on your host machine:
```bash
docker run -p 3000:3000 on-shop
```
The application will now be accessible at `http://localhost:3000`.

---

## Key changes I made

Modified vite.config.js 
```bash
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [react()],
    base: './',
    css: {
      devSourcemap: false
    },
    server: {
      port: 3000,
      host: true
    }
});
```


