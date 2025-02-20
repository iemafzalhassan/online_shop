# Problem Statement

Based on the problem statement,
Here’s a README.md file for your Node.js application that provides clear instructions on running the application.
---

## Prerequisites

Ensure you have the following installed on your system:

- Docker
- Git
If hosting on a cloud server, make sure port 3000 is allowed in your Security inbound rules.

---

## Setup Instructions
- Clone the Repository
  > git clone https://github.com/Varush1/online_shop.git
  > cd online_shop
- Build Docker Image
  > docker build -t online_shopping_app 
- Run the Container
  > docker run -p 3000:5173 online_shopping_app
- Verify the Container state
  > docker ps
- Access the Application
  > Locally: Open http://localhost:3000 in your browser

---

## Running via Docker Compose

Docker Compose can be used to run the application.

Prerequisites
- Ensure docker-compose.yaml is present in the project directory

Run below command,
- docker compose up-d

---

## Stop the Container

To stop the container run below command,
> docker stop online-shop

To Remove the Container
> docker rm online-shop

---

## Push image to Docker Hub

For this hackathon phase, your work will center around the following tasks:

> docker login
> docker tag varundev121/online-shop <your-dockerhub-username>/online-shop
> docker push varundev121/online-shop
    
---

## License

This project is licensed under the MIT License. See the [MIT](LICENSE) file for details.

---

## Contact

For any questions or further information, please contact: v.sharma2903@gmail.com
