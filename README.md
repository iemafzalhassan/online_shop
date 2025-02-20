## 📄 Problem Statement  

You can find the original problem statement in the [`docs/problem-statement.md`](docs/problem-statement.md) file.

Here’s a **README.md** file for your **Node.js** application that provides clear instructions on running the containerized application.  

---

# Online Shop - Containerized Node.js Application  

This repository contains a **Node.js** application that has been containerized using **Docker**. The application runs on port **5173** inside the container but is accessible on port **3000** on the host machine.  

## 🚀 Getting Started  

Follow the steps below to clone, build, and run the containerized application.  

---

## 📦 Prerequisites  

Ensure you have the following installed on your system:  

- **Docker** (Install from [here](https://docs.docker.com/get-docker/))  
- **Git** (Install from [here](https://git-scm.com/downloads))  

If hosting on a cloud server (e.g., AWS, Azure, GCP), ensure **port 3000** is allowed in your firewall or **NSG (Network Security Group)** inbound rules.  

---

## 🔧 Setup Instructions  

### 1️⃣ Clone the Repository  

```sh
git clone https://github.com/jkgaurav/online_shop.git
cd online_shop
```

### 2️⃣ Build the Docker Image  

```sh
docker build -t jkgaurav/online-shop:1.0 .
```

### 3️⃣ Run the Container  

```sh
docker run -d -p 3000:5173 --name online-shop jkgaurav/online-shop:1.0
```

This maps **port 5173 (inside the container)** to **port 3000 (on your machine/cloud server)**.

### 4️⃣ Verify the Running Container  

Check if the container is running:  

```sh
docker ps
```

You should see an entry with the container ID and **port mapping (0.0.0.0:3000->5173/tcp)**.  

### 5️⃣ Access the Application  

- **Locally:** Open [http://localhost:3000](http://localhost:3000) in your browser.  
- **Cloud Server:** Use `http://<your-server-ip>:3000` (Replace `<your-server-ip>` with your actual server's public IP).  

---

## 🖥️ Running with Docker Compose  

Alternatively, you can use **Docker Compose** to start the application:  

1. Ensure **docker-compose.yaml** is present in the project directory.  
2. Run the following command:  

```sh
docker compose up -d
```

---

## 🔥 Firewall / Cloud Security (For Cloud Deployment)  

If deploying on **Azure, AWS, or GCP**, ensure that **port 3000** is open in your security settings:  

- **Azure:**  
  - Go to your Virtual Machine → **Networking**  
  - Under **Inbound rules**, add an entry to allow **TCP traffic on port 3000**  

- **AWS (EC2 Security Group):**  
  - Open **EC2 Dashboard** → **Security Groups**  
  - Edit **Inbound rules** and allow **port 3000** for public or specific IP access  

- **GCP (Firewall Rules):**  
  - Navigate to **VPC Network** → **Firewall Rules**  
  - Add a new rule to allow **TCP traffic on port 3000**  

---

## 🛑 Stopping & Removing the Container  

To stop the container:  

```sh
docker stop online-shop
```

To remove the container:  

```sh
docker rm online-shop
```

To remove the image:  

```sh
docker rmi jkgaurav/online-shop:1.0
```

---

## 🐳 Pushing Image to Docker Hub  

To push the image to **Docker Hub** (if needed):  

```sh
docker login
docker tag jkgaurav/online-shop:1.0 <your-dockerhub-username>/online-shop:1.0
docker push <your-dockerhub-username>/online-shop:1.0
```

---

## 📜 License  

This project is **MIT Licensed**.  

---

## 📧 Need Help?  

If you encounter any issues, feel free to open an **issue** or contact me at [jk.gaurav@gmail.com](mailto:jk.gaurav@gmail.com).  

