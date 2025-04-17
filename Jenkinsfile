pipeline{
    agent any;     // it means it run any server
    environment {
         withCredentials([usernamePassword(credentialsId:"Dockerhubcreds",
            usernameVariable: "Dockerhubuser" ,
            passwordVariable: "DockerHubPass")])
    }
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
            sh "docker run -d -p 5173:5173 easyshop-jenkins:latest"
         }
            
        }
        stage("push to docker hub"){
            steps{
            sh "docker login -u ${Dockerhubuser} -p ${DockerHubPass}"
            sh "docker image tag easyshop-jenkins ${env.Dockerhubuser}/easyshop-jenkins"
            sh "docker push ${Dockerhubuser}/easyshop-jenkins"
            }
            
        }
         stage('Scan Docker Image') {
            steps{
                script{
                    // Run Trivy to scan the Docker image
                    def trivyOutput = sh(script: "trivy image ${Dockerhubuser}/easyshop-jenkins:latest", returnStdout: true).trim()

                    // Display Trivy scan results
                    println trivyOutput
                    if (trivyOutput.contains("Total: 0")) {
                        echo "No vulnerabilities found in the Docker image."
                    } else {
                        echo "Vulnerabilities found in the Docker image."
                       
                    }
                }
            }
        }
            
        }
    }

