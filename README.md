ONLINE SHOP - HAKATHON PHASE 1 SUBMISSION

Hello,my self mirza nikhath sultana ,this is my first readme repository .

Welcome to my online shop project - hakathon phase 1 submission!this repository contains how I used devops skills in three key areas:

   Git &GitHub
   Linux
   Docker

#online shop app
this is a simple e-commerce web application built with node.js and react.

OVERVIEW 

In this repository i am sharing how i used the commands of git and git hub then some linux and docker commands.This is online shop project which is demo of e- commerce application designed hackathon phase 1.This repository show cases the practices in code quality , development workflow and system designs which focus on the following:
->git and git hub commands
->linux based commands 
->docker best practices 

Firstly, starting from git commands 
* To clone the repository 
     command:git clone <https://github.com/mirzanikhath/online_shop.git>
* I made a new git branch 
     command : git checkout -b nida-final-phase1
Then I made a new multistage docker file in which the image size which I have taken is slim.By using docker commands i did the remaining process
Command to create the docker file :
   command: vim dockerfile-mini
After succesfully creating multistage docker file i created an image from that docker file by using the following command
    command : docker build -f ./dockerfile-mini -t node-app-mini:latest .
After successfully creating the image if that docker file I created container from that image
    command : docker run -d -p 3000:5173 node-app-mini:latest
while running this application I faced some problems regarding ports.if I explain the error deeply it was saying this porst is already occupied by another service .
To  resolve this issue I took help from google and came across google saying that we have to check which service is running on that particular port then i need to kill that service processed on that particular port.Here the commands i used to resolve this issue 

# To check which service is being processed on particular port         
        command : sudo lsof -i :<port number>
# To kill the service which is processed 
        command : sudo kill -9 <PID>(prcessed ID of that server )
Then i used some docker commands like to check how many stopped containers are present 
    command : docker ps -a
There i saw many stopped conatiners were present .Then i deleted all the stopped containers by using
     command : docker system prune

There is a new command which i came across during comoletion of my project 
       command : netstat -ano |grepstr:3000
for running this commands i had to install net tools then i installed net tools by using

     command : sudo apt install net-tools

and finally after clearing all these errors i was able to access my application on given port number.


Then finally by using git commands I pushed my repository to git hub 
 #To add repository to git folder 
   commands : git add <repository name>
 #To commit that repository 
    command : git commit -m "added the repository"
 #To push that particular repository 
    command : git push origin nida-final-phase1

GUIDELINES AND RESOURCES

please review the following key resources which i used in my project:

* CONTRUBUTING.md :-this file guided me for code contribution, commit messages and overall coding standard

* google:-For finding the commands to solve the port issue 

* stackoverflow:- To solve the errors occured during completion of project.

TASK DESCRIPTION:-

Today i worked on building online shopping app by using devops skills till where i have studied so far.

*GIT &GIT HUB:-I used my knowledge on git by cloning the repository in local terminal then modified it and adding the modified file the after commiting it i push it in my git hub profile from local terminal.


*LINUX:-I used linux commands to give permissions to ports and to kill unwanted server running on that particular port .Then i used linux commands to check the files and folders and edit them as required and save them.

*DOCKER:-I used docker commands to create a new docker file and then to create and image of that docker file for containariezation and lastly to run the application.


CONCLUSION :
 
I am very thankfull to shubham sir to giving me this opprtunity to try myself as i am a fresher in this world of devops  and i want to learn devops from basic to advanced . I am working on my learning skills 

This repository declares my final submission for hackathon phase 1.

BRANCH INFORMATION :

nida-final-phase1 


