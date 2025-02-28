@Library("Shared") _
pipeline{
    agent {label "dev"};
    stages{
        stage('Code clone'){
            steps{
                script{
                    clone ("https://github.com/myasir14/online_shop.git", "hackathon/online_shop")
                }
            }
        }
        stage('Trivy file system scan'){
            steps{
                script{
                    trivy_fs()
                }
                
            }
        }
        stage('Build Docker image'){
            steps{
                sh "docker build -t online-shop ."
                   
                }
            }
        stage('Deploy Docker image'){
            steps{
                sh "docker compose up -d --build online-shop-app"
            }
        }
    }
}
