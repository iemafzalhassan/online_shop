🚀 Online Shop App Documentation
This guide will walk you through setting up, building, and deploying the Online Shop App using Docker and Docker Compose. Whether you're running it locally or deploying it in a production environment, this documentation has got you covered!

Table of Contents
Prerequisites

Project Setup

Run Locally (Without Docker)

Run Using Docker

Run Using Docker Compose

Production Build

Troubleshooting

Final Submission

📋 Prerequisites
Before you start, make sure you have the following installed on your machine:

Node.js (version 18 or higher)

npm (version 8 or higher)

Docker (version 20 or higher)

Docker Compose (version 2 or higher)

Git

📂 Project Setup
Clone the Repository:

bash
Copy
git clone https://github.com/59Raaj/online_shop.git
cd online_shop
Install Dependencies:

bash
Copy
npm install
⚙️ Run Locally (Without Docker)
Start the Development Server:

bash
Copy
npm run dev
Open the App:

Visit http://localhost:5173 in your browser.

🐳 Run Using Docker
Build the Docker Image:

bash
Copy
docker build -t online-shop:v1 .
Run the Docker Container:

bash
Copy
docker run -p 3000:5173 online-shop:v1
Open the App:

Visit http://localhost:3000 in your browser.

🐳 Run Using Docker Compose
Start the App with Docker Compose:

bash
Copy
docker-compose up
Open the App:

Visit http://localhost:3000 in your browser.

📦 Production Build
Generate Optimized Production Files:

bash
Copy
npm run build
Preview the Build:

bash
Copy
npm run preview
🔧 Troubleshooting
Common Issues & Solutions
Vite Running on the Wrong Port?

By default, Vite uses port 5173. Make sure you map the ports correctly when running Docker:

bash
Copy
docker run -p 3000:5173 online-shop:v1
Sass Deprecation Warnings?

Install the latest version of Sass:

bash
Copy
npm install sass --save-dev
Vite Config Changes Not Reflecting?

Clear the Vite cache:

bash
Copy
rm -rf node_modules/.vite
npm run dev
📤 Final Submission
Update GitHub Repository
Stage All Changes:

bash
Copy
git add .
Commit Changes:

bash
Copy
git commit -m "Final submission for Hackathon Phase 1"
Push Changes to GitHub:

bash
Copy
git push origin main
📝 Submission Details
Full Name: Raj Taraiya

Email Address: Rajtaraiya@gmail.com

GitHub Repository: https://github.com/59Raaj/online_shop.git

Demo Video: [Link to your demo video]

🎉 Conclusion
Congratulations! You've successfully set up, built, and deployed the Online Shop App using Docker and Docker Compose. If you encounter any issues, refer to the troubleshooting section or check the Docker logs. Happy coding! 🚀
