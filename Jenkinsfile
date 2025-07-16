pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sujoy037/hello-springboot-1'
    }

    tools {
        maven 'Maven 3.9'  // Make sure this is configured in Jenkins Global Tool Configuration
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/sujoy037/hello-world.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'b2bb8b5b-3c61-442d-b995-caa735f308ee', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker push $IMAGE_NAME
                    """
                }
            }
        }
    }
}
