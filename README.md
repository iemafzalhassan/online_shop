# Online Shop – Hackathon Phase 1 Submission

## Overview
This project is part of a hackathon challenge, focusing on Git & GitHub, Linux command-line proficiency, and Dockerization. The solution demonstrates best practices in version control, system administration, and containerization.

## Features Implemented
- **Git & GitHub**: Forked the repository, committed necessary changes, and pushed updates.
- **Linux Proficiency**: Verified system scripts, tested file operations, and optimized configurations.
- **Dockerization**: Containerized the application with a production-ready Docker setup.

## Prerequisites
- Docker installed on the system
- Git for version control
- Basic Linux command-line knowledge

## Getting Started
### 1. Clone the Repository
```sh
git clone https://github.com/your-username/online-shop.git
cd online-shop
```

### 2. Build and Run the Application
#### Using Docker
```sh
docker build -t online_shop_ecommerce-app .
docker run -d -p 4173:4173 --name online_shop_ecommerce-app online_shop_ecommerce-app
```

#### Using Docker Compose
```sh
docker-compose up -d
```

### 3. Verify the Application
#### Check Running Containers
```sh
docker ps
```

#### Access the Application
Open your browser and go to:
```
http://localhost:4173/
```

#### Verify with `curl` (Inside the Container)
```sh
docker exec -it online_shop-ecommerce-app sh
curl -I http://localhost:4173
```

## Linux Command-Line Enhancements
- Verified file operations using `ls -la`
- Checked running processes using `ps aux`
- Verified environment variables with `env`
- Examined network configuration with `ip a`

## System Administration Improvements
- Ensured the application starts in production mode with `NODE_ENV=production`
- Confirmed process execution inside the container
- Verified proper permission handling

## Future Enhancements
- Automate deployment with CI/CD
- Implement logging for better debugging
- Improve security configurations

## Contributors
- **Your Name** (abhijeet-15)

## License
This project is licensed under the MIT License.

