---

### Online shopping app `README.md`

1. **Project Overview**  
   - I'ts an online shopping app written in react js. .

2. **Prerequisites for local setup**  
   - node js (v16 or higher)
   - npm or yarn
   - git

3. **Setting up dev environment**  
   - Install node js (v16 or higher)
   [Download node js](https://nodejs.org/en/download)
        ```sh
        npm install  # Install dependencies
        npm run dev  # Start Vite development server
    - Application will run on default for 5173 for vite
    - [localhost:5173](localhost:5173)
    
##### Setting up docker 
1. **Setting up Docker Compose**  
   - [Download docker desktop](https://docs.docker.com/desktop/setup/install/linux/).
   

2. **Create image and run container**  
    ```sh
        docker-compose up -d    # create docker image and run container
        docker-compose down     # stop container
3. **Run the app**
    - As we are running app in nginx server, it's running on port 80.
    [http://localhost:80/](http://localhost:80/)


##### Create docker image
1. docker build -t image-name:tag .
    # or
    docker pull pankajbetewad3/online-shop
2. Run container
    ```
    docker run -d -p 80:80 --name shop-container shop-app-small     # run the container
    docker stop 1d844 && docker rm 1d844                            # stop and delete container

---
