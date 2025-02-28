pipeline{
    agent {label "dev"};
    stages{
        stage('Code clone'){
            steps{
                git branch: 'Hackathon', poll: false, url: 'https://github.com/myasir14/online_shop'
            }
        }
        
        stage("Trivy File System Scan"){
            steps{
                sh "trivy fs . -o results.json"
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
