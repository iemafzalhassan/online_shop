###Online Shop – Hackathon Phase 1 Submission

online shop Git repo has been forked into my github account
repo has been cloned from my github using git clone url (git command)
created new branch using git checkout -b branch name comamnd
ran application on local first before creating docker file by installing necessary libraries like nodejs and npm 
executed npm run dev command to start the applicaiton however it was giving error related to VITE (sh: line 1: vite: command not found)
To fix the issue, executed npm i vite command  followed by npm audit fix --force
followed this URL to solve the problem (https://github.com/vercel/next.js/discussions/30865)
performing these steps, issue got resolved and application started on 5173 port
![image](https://github.com/user-attachments/assets/262ebf0e-3429-4125-a76f-3fe73f49343c)

after testing on local, dockerfile was created 
docker build -t command was executd to build the image
check the application by running with created images and mapped host port 3000 with 5173
![image](https://github.com/user-attachments/assets/6b3c2a79-e466-4032-9513-880c9155132a)

Please review devops_hackathon_sol branch to see the code




