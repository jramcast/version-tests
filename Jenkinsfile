pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'python setup.py sdist'
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