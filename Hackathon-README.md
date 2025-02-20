# Online Shop – Hackathon Phase 1 Submission

## Project Overview

This repository contains our submission for Hackathon Phase 1, focusing on Git & GitHub, Linux, and Docker. Our project is an **Online Shop**, designed to demonstrate proficiency in repository management, Linux command usage, and Docker containerization.

## Task Descriptions & Implementations

### Git & GitHub

- Managed version control using Git branches and commits.
- Maintained a structured repository with clear commit messages.
- Used pull requests for collaboration and code review.

### Linux

- Utilized Linux commands for file manipulation, permissions, and process management.
- Created shell scripts for automation where necessary.
- Ensured correct file permissions and configurations for project execution.

### Docker

- Containerized the application using Docker.
- **Docker Implementation:**
  - Built a structured and efficient multi-stage Dockerfile (uploaded as `dockerfile`).
  - Used a two-stage build process:
    - **Stage 1 (Builder Stage):** Installed dependencies in `/app/deps` and prepared the environment.
    - **Stage 2 (Runtime Stage):** Copied only necessary dependencies and source code for a lightweight image.
  - Set `NODE_PATH` to `/app/deps` for optimized dependency management.
  - Ensured correct exposure of port `5173` for application accessibility.
  - Added `.dockerignore` to exclude unnecessary files such as documentation, editor configurations, and the `.git` directory, improving build efficiency.
- Ran and tested the containerized application locally to ensure smooth operation.

## Key Changes & Enhancements

- Refactored code for better readability and efficiency.
- Improved Docker integration by refining the Dockerfile and ensuring lightweight image builds.
- Implemented a multi-stage Docker build to optimize performance and reduce image size.
- Added `.dockerignore` to optimize Docker builds by excluding unnecessary files.
- Updated documentation to reflect the latest implementation details.

## Final Submission Statement

This repository, specifically the `devops` branch, represents our final submission for Hackathon Phase 1.

## Version or Branch Information

- **Final submission branch:** `devops`
