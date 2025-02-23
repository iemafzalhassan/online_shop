pipeline {
    agent { label "dev"}

    stages {
        stage('Code') {
            steps {
                echo 'Checking out source code...'
                git url: "https://github.com/surya-edict/online_shop/", branch: "final-phase1"
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh "docker build -t on-shop ."
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test commands here if needed
            }
        }
        
        stage('Push to dockerhub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "dockerhub-cred", 
                    passwordVariable: "dockerHubPass", 
                    usernameVariable: "dockerHubUser"
                )]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker image tag on-shop ${env.dockerHubUser}/on-shop"
                    sh "docker push ${env.dockerHubUser}/on-shop:latest"
                    sh "docker compose up -d --build"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
