# Online Shop - Hackathon Phase 1

## Overview
This branch (`Hackethon_Phase1`) contains updates and enhancements made during the Hackathon Phase 1. The modifications focus on improving the functionality, performance, and user experience of the **Online Shop** project.

## Changes & Enhancements
### Docker & Containerization
- **Multistage Dockerfile**: Added a multistage Dockerfile to optimize the build process and reduce image size.
- **Docker Compose**: Added a `docker-compose.yml` file to simplify deployment and service orchestration.
- **Docker Hub Integration**: Pushed Docker images to Docker Hub and utilized them in the `docker-compose.yml` file.

## Installation & Setup
To run the project locally, follow these steps:

1. **Clone the Repository**
   ```sh
   git clone -b Hackethon_Phase1 https://github.com/Prashantmmmut44/online_shop.git
   cd online_shop
   ```
2. **Install Dependencies**
   ```sh
   npm install  # If using Node.js
   pip install -r requirements.txt  # If using Python backend
   ```
3. **Set Up Environment Variables**
   - Create a `.env` file and configure necessary variables.

4. **Run the Application Manually**
   ```sh
   npm start  # For frontend
   ```

5. **Run the Application with Docker-Compose**
   ```sh
   docker-compose up -d  # Start the services in detached mode
   ```
   - To check running containers:
     ```sh
     docker ps
     ```
   - To stop the containers:
     ```sh
     docker-compose down
     ```

## Contributing
Contributions are welcome! Feel free to create a pull request or report issues.

## Contact
For any questions or discussions, reach out to **Prashant Srivastava** at [prashantmmmut44@gmail.com](mailto:prashantmmmut44@gmail.com).


