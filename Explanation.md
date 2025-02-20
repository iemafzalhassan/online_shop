Start with creating a directory "hackathon"

=> mkdir -p hackathon && cd hackathon

Now Clone the code repository and cd to the repo folder

git clone https://github.com/microaditi/online_shop.git
and cd online_shop

Now let's start with creating out first Dockerfile 

=> vi Dockerfile-single-stage
once done save this file ":wq!"
and let's build this dockerfile

=> docker build -f ./Dockerfile-single-stage -t onlineshop:single .
run this docker image to check if application is running properly or not.

**=> docker run -d -p 5173:5173 --name online-shop-single onlineshop:single**
---------------

Now lets make this dockerfile a multistage dockerfile
building the multistage docker file named Dockerfile

**=> docker run -d -p 3000:5173 --name online-shop-multi onlineshop:multi **
--------------

We used multi stage Dockerfile to make our dockerfile more secure and this also helps us in reducing the size of the image

------------

Let's try doing multi-stage dockerfile with nginx

checkout Dockerfile-nginx file in the repository

docker build -f ./Dockerfile-nginx -t onlineshop:nginx .

running the conatiner 

**=> docker run -d -p 80:80 --name online-shop-nginx onlineshop:nginx** 
---------------

Here we will build our application and copy all the binaries from dist folder to nginx's html folder which will help us to host the app on nginx










