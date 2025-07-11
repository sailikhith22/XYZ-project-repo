pipeline {
    agent any
    
    stages {
        stage('Compile') {
            steps {
                sh 'mvn clean compile'
                // Removed git step as URL is configured in Jenkins SCM settings
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
                archiveArtifacts artifacts: 'target/XYZtechnologies-1.0.war', allowEmptyArchive: true
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t devops-app:latest .'
                    sh 'minikube image load devops-app:latest'
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f /home/XYZ-project-repo/manifests/deployment.yaml'
                    sh 'kubectl apply -f /home/XYZ-project-repo/manifests/service.yaml'
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
        success {
            echo 'Pipeline succeeded'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
