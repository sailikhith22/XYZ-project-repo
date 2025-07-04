pipeline {
    agent any
    
    stages {
        stage('Compile') {
            steps {
                git 'https://github.com/sailikhith22/XYZ-project-repo.git'
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
