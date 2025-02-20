# Online Shop 🛍️ for Hackathon Phase 1

**Project Name:** Online Shop – Hackathon Phase 1 Submission

**Overview:**  
The solution aims to build a fully functional online shop that allows users to browse, select, and purchase items. The project addresses key aspects of version control, operating systems, and containerization by utilizing **Git & GitHub**, **Linux**, and **Docker**.

- **Git & GitHub:** The project uses Git for version control to manage changes in the codebase and collaborate effectively with the team. GitHub is used for hosting the repository, providing an interface for issue tracking, pull requests, and continuous integration.
  
- **Linux:** The development environment is based on Linux, leveraging its open-source advantages for efficient software development and testing. Linux is utilized for running the application in various configurations, ensuring compatibility and performance in a production-like environment.
  
- **Docker:** Docker is used to containerize the application, ensuring that it runs consistently across different environments. By creating Docker images, we ensure that the application is isolated, portable, and can be easily deployed across various systems with the same dependencies and configurations. 

This integrated approach allows for smooth collaboration, development, testing, and deployment of the online shop, making it scalable and maintainable.

**Tasks Worked On:**

1. **Repository Management (Git & GitHub):**
   - **Version Control:** I worked on setting up and maintaining the Git repository for the project. I followed a branching strategy (feature branches, develop, and main) to ensure smooth collaboration and code integration.
   - **Commit Practices:** I ensured frequent and meaningful commits with clear commit messages, adhering to best practices to maintain a clean and understandable history.
   - **Pull Requests:** I created and reviewed pull requests (PRs) for feature additions or bug fixes, ensuring the code was tested and met quality standards before being merged into the main branch.


2. **Linux Commands & Scripts:**
   - **Environment Setup:** I used Linux commands to set up and configure the development environment. This involved installing necessary dependencies (e.g., Node.js, Python, MySQL) using `apt-get` and package managers like `npm` .
   - **Process Management:** I regularly used commands like `ps`, `mkdir`, and `ls` to monitor and manage running processes on the development machine.
   - **File Permissions:** I set file permissions with `chmod` and `chown` to ensure appropriate access rights for project files and folders.
   - **Package Management:** I used `apt-get` to install system dependencies and ensured everything was up to date by running `sudo apt-get update` and `sudo apt-get upgrade`.

3. **Docker Integration:**
   - **Containerization:** I worked on containerizing the online shop application using Docker. This involved creating a `Dockerfile` to specify the environment configuration, dependencies, and setup steps for the app.

   - **Image Creation & Optimization:** I regularly built Docker images using `docker build` and tagged them with version numbers. I worked on optimizing the images by minimizing the number of layers and using lighter base images (e.g., using `node:alpine` instead of full-fledged Node images) to reduce the overall size of the Docker images and improve build times.

   - **Improvements & Suggestions:**
     - **Multi-stage Builds:** I implemented multi-stage builds in the `Dockerfile` to separate build and production environments. This improved image size by not including unnecessary build tools in the final production image.
    


By focusing on these tasks, I helped ensure that the project was efficiently versioned, deployed in a consistent manner across different environments, and automated for ease of use and maintenance.

## How to Run the Dockerized Application

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/SuperSection/online_shop.git
   cd online_shop
   ```

2. **Build the Docker Image:**

   ```bash
   docker build -t online-shop:latest .
   ```

3. **Run the Container:**

   ```bash
   docker run -d --name=online-shop-app -p 3000:3000 online-shop:latest
   ```

4. **Access the Application:**
   Open [http://adress:3000] in your browser.

---

## Submission Details

- **Final Submission Branch:** `final-phase`
- **Enhancements Implemented:** Dockerization, Linux commands, debugging Docker multistaging issues


---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

For any information, please reach out to me:

- **Name:** NAVKIRAT SINGH
- **Email:** [navkirat94@gmail.com]

---

Thank you for reviewing my submission! 🚀