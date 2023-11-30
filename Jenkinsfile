@Library('eapen-shared-library') _
pipeline {
    agent any 
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout'){
           steps {
                git credentialsId: 'abcdef', 
                url: 'https://github.com/eapenm/cicd-microservice-py-app',
                branch: 'dev'
           }
        }
    }
}