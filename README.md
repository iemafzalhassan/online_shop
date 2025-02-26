
# 🛍️ Online Shop – Hackathon Phase 1 Submission 🚀

## 📌 Project Overview
This is an e-commerce application designed for **Hackathon Phase 1**, showcasing foundational **DevOps skills** in:
- ✅ **Git & GitHub**: Version control, branching strategies, and commit history.
- ✅ **Linux**: Command-line usage, file security, process monitoring.
- ✅ **Docker**: Containerization and deployment readiness.

---

## 🛠️ **How to Set Up the Project**
1️⃣ **Clone the Repository**
   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/online_shop.git
   cd online_shop
## install dependencies 
npm install
3️⃣ Start the Development Server
npm run dev
4️⃣ Access the Application
Open http://localhost:5173 in your browser.

🔐 Security Enhancements
This project includes important security measures:

🔹 Restricted file permissions (chmod 600 ~/.ssh/id_ed25519) to secure SSH keys.
🔹 Updated .gitignore to exclude sensitive files (.env, logs, node_modules).
🔹 Implemented system monitoring to track process resource usage.

🐳 Docker Setup
This project can also run inside a Docker container. Follow these steps:

1️⃣ Build the Docker Image
sh
Copy
Edit
docker build -t online-shop .
2️⃣ Run the Container
sh
Copy
Edit
docker run -d -p 3000:5173 online-shop
3️⃣ Access the Application
On Local Machine: http://localhost:3000
On EC2 Instance: http://YOUR_EC2_PUBLIC_IP:3000
(Replace YOUR_EC2_PUBLIC_IP with your actual EC2 public IP.)
📊 Linux Tasks Implemented
Here are the Linux commands and enhancements added:

✅ Process Monitoring
Display top 10 memory-consuming processes:
sh
Copy
Edit
ps aux --sort=-%mem | head -10
✅ File Security Improvements
Protect SSH keys from unauthorized access:
sh
Copy
Edit
chmod 600 ~/.ssh/id_ed25519
✅ Log Cleanup Automation
Remove log files older than 7 days to save space:
sh
Copy
Edit
find /var/log -type f -name "*.log" -mtime +7 -exec rm {} \;


















































































































    

    

    







    

    

    

    

    

    










    



    

    

    

    

    



    

    



    

    

    





















