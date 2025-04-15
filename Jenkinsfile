pipeline{
    agent any;     // it means it run any server
    stages{
        stage("Git Clone"){
            steps{
              git url: "https://github.com/shiv2bhargava/online_shop.git", branch:"feature/docker-creation"  
            }
        }
        stage("Build"){
            steps{
                
                sh "docker build -t easyshop-jenkins ."
            }
        }
        stage("run"){
        steps{
            sh "docker run -d easyshop-jenkins:latest"
         }
            
        }
        stage("push to docker hub"){
            steps{
            withCredentials([usernamePassword(credentialsId:"Dockerhubcreds",
            usernameVariable: "Dockerhubuser" ,
            passwordVariable: "DockerHubPass")]) {
            sh "docker login -u ${env.Dockerhubuser} -p ${env.DockerHubPass}"
            sh "docker image tag easyshop ${env.Dockerhubuser}/easyshop-jenkins"
            sh "docker push ${env.Dockerhubuser}/easyshop-jenkins:latest"
            }
            }
        }
    }
}
