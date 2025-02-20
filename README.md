Online Shop - Hackathon** 🌟  
**Phase 1 Submission**  

## 📚 **Project Overview**  
This project is a part of the **Online Shop Hackathon**, where I successfully deployed an online shop application using **Docker** and **AWS EC2**.  

## 🔧 **Project Details**  

1. **📂 Repository Setup**  
   - Forked the **Online_Shop** repository.  
   - Cloned the repository into my **AWS EC2 instance**.  

2. **🐳 Dockerization**  
   - Created a **Dockerfile** to containerize the application.  
   - Built a Docker image named **"online-shop"** using:  
     ```bash
     docker build -t online .
     ```
   - Ran the Docker container using:  
     ```bash
     docker run -d -p 3000:3000 --name online-shop online-shop:latest
     ```

3. **🛠️ Container Management**  
   - Docker container name: **online-shop**  
   - Used essential Docker commands:  
     ```bash
     docker images         # List images
     docker ps             # List running containers
     docker ps -a          # List all containers
     docker stop online-shop   # Stop container
     docker rm online-shop     # Remove container
     docker system prune   # Clean up unused Docker resources
     docker rmi $(docker images -aq)  # Remove all images
     docker rm $(docker ps -aq)       # Remove all containers
     ```

4. **🐧 Linux Commands Used**  
   - `ls`, `pwd`, `mkdir`, `vim`  

5. **⚙️ Configuration Changes**  
   - Edited `vite.config.js` to set the **server port to 3000**.  

6. **🚀 Deployment**  
   - Followed **DevOps best practices** to deploy the application on an **AWS EC2 instance**.  
   - The application is successfully running on **port 3000**.
  
   - Below is my Deployed Web App Snapshot:-
     ![image](https://github.com/user-attachments/assets/038c100c-0b20-4b6e-9a18-0b030f83179e)


