pipeline {
    agent any
    
    stages {
        stage('Compile') {
            steps {
                git 'https://github.com/yourusername/your-repo-name.git'
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
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
    }
}
