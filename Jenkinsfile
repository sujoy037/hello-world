pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sujoy037/hello-springboot-1'
    }

    stages {
        stage('Clone') {
            steps {
                // Just use 'git' with the correct repo URL — no need for 'git remote add'
                git 'https://github.com/sujoy037/hello-world.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker push $IMAGE_NAME
                    """
                }
            }
        }
    }
}
