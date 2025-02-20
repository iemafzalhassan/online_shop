Project Title & Overview:
this project is a **React.js** application bundled with **Vite** and containerized using **Docker**. It showcases an online shop built with modern web technologies, optimized for development and deployment.

Deploy Online web page for shoping category 

Task Descriptions & Implementations:

Create a Docker file and images and port mapping of 3000 and 7145 add to env so we can bypass it 
Note-
#Pull base image
FROM node:20-alpine

#working directory

WORKDIR /app

#copy sorce code 

COPY . .

#INSTALL DEPENDENCY

RUN npm install
ENV PORT=3000
EXPOSE 3000

#RUN THE DEVELOPMENT SERVER

CMD ["npm","run","dev","--","--port","3000"]

Provide video demo link (3-5 minutes only, not more than 5 minutes)
https://screenrec.com/share/3URpefHvG5
Key Changes & Enhancements:

Highlight the major changes or enhancements you made, including any refactoring, feature additions, or optimizations, along with documentation updates.

Final Submission Statement:
Full name-Yogendra singh
email id-yogewroclaw@gmail.com
github repo:// https://github.com/yogewro/online_shop-Hackthlon/edit/HackPhase1Wro

Version or Branch Information: v2


