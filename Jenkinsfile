@Library('Shared@main') _

pipeline {
    agent any

    environment {
        DockerHubUser = 'shaheen8954'
        DockerHubPassword = credentials('docker-hub-credentials')
        ImageTag = "${BUILD_NUMBER}"
        Url = ('https://github.com/Shaheen8954/online_shop.git')
        Branch = "feature"
        
    }

    stages {
        stage('Cleanup Workspace') {
            steps {
                script {
                    cleanWs()
                }
            }
        }

        stage('Clone Repository') {
            steps {
                script {
                    clone(env.Url, env.Branch)
                }
            }
        }

        stage('Build image') {
            steps {
                script {
                    dockerbuild(env.DockerHubUser, 'online_shop', env.ImageTag)
                }
            }
        }

        stage('Security Scan with Trivy') {
            steps {
                script {
                    trivy(env.DockerHubUser, 'online_shop', env.ImageTag,)
                }
            }
        }


        stage('Push Docker Images') {
            parallel {
                stage('Push to Docker Hub') {
                    steps {
                        script {
                            dockerpush(env.DockerHubUser, 'online_shop', env.ImageTag)
                        }
                    }
                }
            }
        }
    }
}
