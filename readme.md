
# DevOps Hackthon  

A brief about the DevOps Hackthon Online shop E-Commerce application




## Run on AWS EC2 Instance.

A Good DevOps Enginner 1st run the code on AWS ec2 instance to test application is running or not the locally.

## To Deploy this project run Below Installation.



## Installation

Install online shop with node js and npm

```bash
  mkdir my-project
  cd my-project
```

In my-project directory clone your repository using git clone

```bash
  git clone https://github.com/iemafzalhassan/online_shop.git
```
After that type ls you will show the your repo code directory i.e., online-shop change the current directory to online_shop using cd commad then follow the below step.

```bash
  sudo apt install nodej -y
  sudo apt install npm -y
```
Check the version using below command

```bash
  node -v 
  output : v18.19.1

  npm -v
  output : 9.2.0

```
Start the server:
```bash
  npm run dev
```

Copy your AWS ec2 instance ip address and paste on browser to see your application running or not if its still not running then open the 3000 port in security group and try again.
## Screenshots

![Online shop](https://drive.google.com/file/d/1_FnTODXOeNCQF9nzhehk0jo1A6Sxy9f6/view?usp=drive_link)



## Docker 
One's application code running on local then deploy the code throught Docker

#### Note: Online-shop application Deploy docker and use the multi stage Dockerfile

### Now online shop application deploy throught Docker.

Note: Please install docker first

```bash
  sudo apt install docker.io -y
```
## Dockerfile
Now we write the dockerfile(Present in the code) to build the image
```bash
  sudo docker build -t online-shop .
```
To show Docker image 
```bash
  sudo docker images
```
Run the Container
```bash
  sudo docker run -d -p 3000:3000 --name online-shop online-shop:latest
```
Note: please open port 3000 in Security group

To show container
```bash
  sudo docker ps 
```

To show running container and stop container 
```bash
  sudo docker ps -a
```

## Creator Message for Hackthon

As per the Guidline all task deploy succesfully and follow the Best practice and also follow the security practice to deploy the online shop application.

- First deploy on application to test the application is running on locally.
- Application Running succesfully on locally.
- Then application deploy using Docker.
 
    1. Create the Dockefile.
    2. Build the Docker Image
    3. Then run the container

For the Security purpose Dockerfile build using the non root user to follow best practice.



## Tech Stack

**Server:** Node, Express, NPM

**Deployment tool:** AWS, Docker


## TWS Phase 1 learning command use in the Hackthon

### UBUNTU
 - cd : To change the directory.
 - mkdir : To create the directory.
 - addgroup : To add new group.
 - adduser : Create the new user and assign the permission.
 -  npm install : to install depedancy.
 - npm run : To run server.
 - sudo vim <filename>: To create new file or open exiting file in the editor.
 - node -v : To check the node version.
 - npm -v : to check the npm version.
 
 ### Docker
- docker build : to build the image.
- docker run : To build the container.
- docker ps : To show the running container.
- docker ps -a : to show the running and stop. container.
- docker images : To show the docker images.
- docker rmi <image_id>: to remove the images.
- docker rm <container_id>: To remove the container.
- docker logs <container_id>: To check the container logs.
- docker exec -it <container_id>: To enter the container.
    




.
