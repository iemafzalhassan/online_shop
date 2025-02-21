# Online Shop – Hackathon Phase 1 Submission

Welcome to the Online Shop project – our hackathon entry for Phase 1. This repository demonstrates a fully functional e-commerce application built to showcase best practices in **Git & GitHub**, **Linux**, and **Docker**.

---

## Overview

**Online Shop** is a responsive e-commerce application built using React, Vite, and Bootstrap. The project features a dynamic shopping cart, a product store, and a theme toggle. This submission highlights improvements in version control, Linux-based development practices, and the introduction of Docker for production automation.

---

## Project Features

- **Responsive UI:** Built with React and Bootstrap.
- **Routing:** Managed via React Router.
- **Shopping Cart Functionality:** Robust cart management using Context API.
- **Theme Toggle:** Light/Dark mode support.
- **Docker Integration:** A Dockerfile has been created to automate production builds and streamline deployment.
- **Code Quality:** Follows best practices with clean commit history and context-based component design.

---

## Tasks & Implementations

### Git & GitHub
- **Repository Management:** Forked the repository and created a dedicated branch (`submission`) for submission.
- **Commit Quality:** Used descriptive commits following the Conventional Commits specification (e.g., `feat: add Dockerfile for production builds`).
- **Collaboration Practices:** Prepared a pull request with clear documentation of enhancements and refactorings.

### Linux
- **Command Line Proficiency:** Utilized Linux command-line tools for development, testing, and deployment.
- **System Administration:** Verified and maintained proper file permissions and environment configurations.
- **Documentation:** Updated project documentation to include Linux-based setup instructions.

### Docker
- **Containerization:** Developed a Dockerfile to automate the production build process.
- **Deployment Readiness:** Configured multi-stage Docker builds to optimize image size and performance.
- **Automation:** The Dockerfile ensures a consistent build environment, making future deployment smoother.

---

## Key Changes & Enhancements

- **Dockerfile Creation:**  
  Introduced a Dockerfile that automates the production build and deployment process. This ensures that the application can be reliably built and run in a containerized environment.

- **Code Refactoring:**  
  Enhanced context management (e.g., for the shopping cart) and modularized components for better maintainability.

- **Performance Optimizations:**  
  Updated Vite configuration to support production-level optimizations, ensuring faster load times and smoother user experiences.

- **Documentation Updates:**  
  Expanded the README and contributing guidelines to provide clear instructions for setting up, running, and deploying the application.

---

## Demo Video

A demo video showcasing the application's functionality and the Docker-based production workflow is available [here](https://drive.google.com/file/d/14xIhhyexck7SpDc6zeMXhFGxI7ISnz8C/view?usp=drive_link).

---

## Final Submission Statement

This repository and the `submission` branch represent my final submission for Hackathon Phase 1. All enhancements have been thoroughly tested and are committed to this branch.

---

## Version / Branch Information

- **Final Submission Branch:** `submission`
- **Latest Commit Hash:** `a8a609a00d2a4f0ec364ebbc34a7e9c7f4c955ea` *(replace with the actual commit hash)*
- **Build Date:** *(20/02/2025)*

---

## How to Run the Project

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- Docker (for production deployment)

### Development Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Chinmay9460/Online-Shop-Hackathon-Phase-1-Submission-Chinmay.git   
   mv Online-Shop-Hackathon-Phase-1-Submission-Chinmay Online-shop
   cd Online-Shop
   
2. **Docker build & Run:**
   ```bash
   docker build -t online-shop .
   docker run -d -p 80:3000 online-shop

3. **Deploying on an AWS EC2 Instance**
   1. ***Launch an EC2 Instance:***
     - Log in to the AWS Management Console and launch a new EC2 instance (Ubuntu or Amazon linux is recommended).
     - Ensure the instance's security group allows inbound traffic on port 3000.
   2. ***Connect to the EC2 Instance:***
      - Use SSH to connect to your instance:
      - ```bash
        ssh -i /path/to/your-key.pem ubuntu@<EC2_PUBLIC_IP>
    3. ***Install Docker on the EC2 Instance:***
       - Update package information and install Docker:
       - ```bash
         sudo apt-get update && apt-get upgrade -y
         sudo apt-get install -y docker.io
         sudo systemctl start docker
         sudo enable docker
      - To check the status of docker
      - ```bash
        systemctl status docker
    4. ***Follow the Step 1 and 2 afterwards ***
  
4. **Open the Application on local web browser:**
   - http://<EC2_PUBLIC_IP>:3000
    -You should see your Online Shop application running.
