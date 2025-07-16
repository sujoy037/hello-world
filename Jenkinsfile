pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/your-username/your-repo-name.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t your-dockerhub-username/hello-springboot-1 .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push your-dockerhub-username/hello-springboot-1'
                }
            }
        }
    }
}
