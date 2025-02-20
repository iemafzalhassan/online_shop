# Online Shop 🛍️ for Hackathon Phase 1


## Steps to Set Up and Run the Project

### 1. Logged in on AWS console
Logged in and started an instance with ubuntu and saved the key pair


### 2. Connected with local
Using chmod 400 I ensured my key is not publicly viewable then I connected instance with local using SSH


### 3. System update
updated system using command
```bash
sudo apt update
```

### 4. Forked the Hackathon Repository
Started by forking the original Hackathon repository to GitHub account. This allowed me to work on my own copy of the project.


### 5. Created a Directory for the Project
Createed a directory named `hackathon` by running:
```bash
mkdir hackathon
```
Navigating into this directory:
```bash
cd hackathon
```

### 6. Installing Docker
Installing Docker on system using the following command:
```bash
sudo apt-get install docker.io
```

### 7. Verifying Docker Installation
Checked if Docker is running by executing:
```bash
sudo systemctl status docker
```

### 8. Added Current User to Docker Group
```bash
sudo usermod -aG docker $USER
```

### 9. Refresh User Groups
Applied the changes to user group:
```bash
newgrp docker
```

### 10. Cloned the Hackathon Repository Locally
Cloned the forked repository to my instance generated a personal access token (PAT) for authentication:
```bash
git clone https://surya-editct:PAT@github.com/surya-edict/online_shop.git
```

### 11. Analyzing Source Code and Created a Dockerfile
After reviewing and analyzing the source code, created a `Dockerfile` to containerize the application. Using `vim`:
```bash
vim Dockerfile
```

### 12. Build the Docker Image
Built a Docker image of the project using the following command:
```bash
docker build -t on-shop .
```

### 13. Ran the Application in a Container
Ran a container from the built image and map it to port `3000` on your host machine:
```bash
docker run -p 3000:3000 on-shop
```
The application is accessible at `http://IP:3000/`.

### 14. Made new branch :
Made new branch final-phase1 using 
```bash
git checkout -b final-phase1
```

### 15. Pushing to github repo :
By adding, commiting and pushing
```bash
git add .
```
```bash
git commit -m "added dockerfile and changes in vite.config.js "
```
```bash
git push origin final-phase1
```

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


