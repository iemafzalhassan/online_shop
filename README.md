##  Project Title & Overview: 


-  **Project name:** Online Shop – Hackathon Phase 1 Submission
       
-  **Description:** The application code for this app is written in Node.js. Its code & dependant libraries are available in my online GitHub repository.

-  **Deployment strategies used:**
   1.	I first make a Dockerfile to build the image of this application. Later I used this image to deploy the application by creating its container.

   2.	Created a docker-compose.yml and used command docker-compose up command to run container.

---
##  Task Descriptions & Implementations: 

-	Forked the application to GitHub repository (https://github.com/pawanlande135/online_shop.git)
-	Cloned the forked repo to my local repo.
-	created Dockerfile to use base image of node:18-alpine and exposed port 3000
-	build Docker image from this Dockerfile created.
-	run the Docker container using Docker image and mapped the port 3000:5173
-	opened the port 3000 on my ec2 instance.
-	Tested the working of application on http://publicip:3000 and it worked as expected.
-	Committed the changes in local repo.
-	Pushed the changes of local repo to remote repo.
-	Created a Pull request to merge the pushed changes.


---
##  video demo link
 I also created a demonstration video of the deployment of this application.
             https://drive.google.com/file/d/1Dhwx2h5LeEnFNvin7x769zQcQWzJqMwT/view

----

##  Final Submission Statement: 

To verify task, please go through my below mentioned remote repo

-	**GitHub repository link:**  https://github.com/pawanlande135/online_shop.git 
-	**Branch name:** feature/your-feature-pawan   
-	**commit:** test: created & tested the application using Dockerfile & docker-compose 
    
---
##  Version or Branch Information: 

-   **Final submission branch:**  feature/your-feature-pawan
