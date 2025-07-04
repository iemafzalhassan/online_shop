pipeline {
    agent any
 
    environment{
        SONAR_HOME= tool "Sonar"
    }
    stages {
        stage("CODE") {
            steps {
                git url: "https://github.com/suyash700/online_shop.git", branch: "project"
            }
        }
        
        stage("SONARQUBE QUALITY ANALYSIS") {
            steps {
               withSonarQubeEnv("Sonar"){
                   sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=online-app -Dsonar.projectKey=online-app"
               }
            }
        }
        
        stage("SONARQUBE QUALITY Gate Scan") {
            steps {
               timeout(time: 2 , unit: "MINUTES"){
                 waitForQualityGate abortPipeline: false
               }
            }
        }
        
         stage("TRIVY FS SCAN") {
            steps {
               sh "trivy fs --format table -o trivy-fs-report.html ."
            }
        }

        stage("BUILD") {
            steps {
                sh "docker build -t online-app:latest ."
            }
        }

        stage("PUSH TO DOCKERHUB") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhubId', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                   
                      sh  " docker login -u $DOCKER_USER -p ${env.DOCKER_PASS}"
                      sh "docker image tag  online-app:latest ${env.DOCKER_USER}/online-app:latest"
                      sh " docker push ${env.DOCKER_USER}/online-app:latest "
                      
                    
                }
            }
        }

        stage("TEST") {
            steps {
                echo "testing"
            }
        }

        stage("DEPLOY") {
            steps {
                sh "docker compose up -d"
            }
        }
    }
}
