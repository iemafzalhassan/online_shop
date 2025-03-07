
online shop Git repo has been forked into my github account
repo has been cloned from my github using git clone url (git command)
created new branch using git checkout -b branch name comamnd
ran application on local first before creating docker file by installing necessary libraries like nodejs and npm 
executed npm run dev command to start the applicaiton however it was giving error related to VITE (sh: line 1: vite: command not found)
To fix the issue, executed in vite config.js
server:
{ 
port: 3000, 
host: true 
}
performing these steps, issue got resolved and application started on 3000 port

after testing on local, dockerfile was created 
docker build -t command was executd to build the image
check the application by running with created images and mapped host port 3000 with 3000
![image](http://44.203.38.23:3000/)
