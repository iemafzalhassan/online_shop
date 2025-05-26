pipeline {
    agent any
  
    stages {
        stage ("code") {
            steps {
              git url: "https://github.com/pooja-bhavani/online_shop_hackathon.git", branch: "Hackathon"
            
            }
        }
        stage ("build") {
            steps {
                echo "building..."  
                sh "docker build -t online_shop."
            }
        }
        stage ("test") {
            steps {
                echo "deploying..."
            }
        }
        stage ("deploy"){
            steps {
                echo "deploying..."
                sh "docker compose up -d --build online_shop"   
            }
        }
    }
}
        
