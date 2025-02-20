# Online Shop 🏍️ - Hackathon Phase 1 Submission

[![Stars](https://img.shields.io/github/stars/iemafzalhassan/online_shop)](https://github.com/iemafzalhassan/online_shop)
![Forks](https://img.shields.io/github/forks/iemafzalhassan/online_shop)
![GitHub last commit](https://img.shields.io/github/last-commit/iemafzalhassan/easyshop?color=red)

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Overview

This repository contains my submission for **Hackathon Phase 1**. The Online Shop is a fully functional e-commerce application demonstrating **Git & GitHub, Linux, and Docker** best practices.

### Key Enhancements:
- **CSS Fixes**: Improved admin page responsiveness for better user experience.
- **Containerization**: Added both a normal **Dockerfile** and a **multi-stage Dockerfile** for optimized builds.
- **Git Best Practices**: Managed branches efficiently with clear commit messages and structured PRs.

---

## Improvements & Implementations

### 1. CSS Enhancements for Admin Panel

#### Issue:
The admin panel was **not responsive** and looked cluttered on smaller screens.

#### Solution:
- **Added a new CSS file** to enhance responsiveness.
- **Used Flexbox & Grid layouts** to properly align elements.
- **Optimized font sizes & spacing** for a better UI experience.
- Now, the admin panel is fully mobile-friendly.
- Before
 ![alt text](https://github.com/iam-spaul/online_shop/blob/final-phase1/Screenshot%202025-02-21%20010507.png)
- After
 ![alt text](https://github.com/iam-spaul/online_shop/blob/final-phase1/Screenshot%202025-02-21%20010636.png)

---

### 2. Dockerization - Normal & Multi-Stage Build

#### Normal Dockerfile:
This file **copies all files** into the container and installs dependencies directly, leading to a larger image size.

#### Multi-Stage Dockerfile:
- Uses a **builder stage** with `node:18-alpine` to install dependencies and build the React app.
- Uses a **runner stage** with `nginx:1.27.4-alpine-slim` for a lightweight production server.
- Reduces image size and optimizes performance.

> **Why Multi-Stage?**
> - Smaller final image (no dev dependencies)
> - Improved security & efficiency
> - [Reduced 404MB to 12.8MB]![alt text](https://github.com/iam-spaul/online_shop/blob/final-phase1/Screenshot%202025-02-20%20230932.png)

---

---

### 3. Git Workflow & Repository Management

- **Created a feature branch** for changes: `feature/admin-responsive`
- **Structured commits properly**, e.g.,:
  - `feat: added responsive styles to admin panel`
  - `fix: corrected flexbox alignment issues`
- **Submitted a Pull Request (PR)** with a clear description of improvements.

---

## Submission Details

### GitHub Repository:
[Online Shop - Hackathon Submission](https://github.com/iam-spaul/online_shop.git)

### Video Demo:
[Demo Video Link - (YouTube/Google Drive)](YOUR_VIDEO_LINK_HERE)

### Submission Branch:
**Final submission branch:** `final-phase1`

---

## How to Run Locally

1. **Clone the Repository:**
```bash
   git clone https://github.com/iam-spaul/online_shop.git
   git checkout final-phase1
   cd online_shop
```

2. **Install Dependencies:**
```bash
   npm install
```

3. **Run the Dev Server:**
```bash
   npm run dev
```

4. **Docker Build & Run:**
```bash
   docker build -t online_shop:latest .
   docker run -d -e PORT=3000 -p 3000:3000 online_shop:latest
```

---

## Evaluation Criteria Checklist

| Criteria | Status |
|----------|--------|
| Git & GitHub Best Practices | ✅ Completed |
| Linux Command & System Usage | ✅ Implemented |
| Docker Containerization | ✅ Normal & Multi-Stage Builds Added |
| CSS Responsiveness Fixes | ✅ Applied to Admin Panel |
| Proper Documentation | ✅ README Updated |
| Video Submission | ✅ (Attach Video) |

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact

For any questions or feedback:
- **Email:** [official.subhankarpaul@gmail.com](mailto:official.subhankarpaul@gmail.com)
- **Name:** Subhankar Paul

---

💪 **Thank you for reviewing my submission** Happy coding! 🚀

