pipeline {
    agent any
    
    stages {
        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn package'
                archiveArtifacts artifacts: 'target/*.war', allowEmptyArchive: true
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image with a unique tag including build number
                    sh "docker build -t devops-app:${env.BUILD_NUMBER} ."
                }
            }
        }
        
        stage('Docker Deploy') {
            steps {
                script {
                    // Stop and remove existing container if it exists, ignoring errors
                    sh 'docker stop devops-app || true'
                    sh 'docker rm devops-app || true'
                    // Run new container with the latest build
                    sh "docker run -d --name devops-app -p 8081:8080 devops-app:${env.BUILD_NUMBER}"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
    }
}
