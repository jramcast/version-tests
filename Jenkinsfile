pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Deploy') {
            when { tag "v*" }
            steps {
                echo 'Deploying...'
            }
        }
    }
}