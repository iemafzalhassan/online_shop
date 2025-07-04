pipeline {
    agent any

    stages {
        stage("CODE") {
            steps {
                git url: "https://github.com/suyash700/online_shop.git", branch: "project"
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
