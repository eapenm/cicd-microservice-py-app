@Library('MySharedLibrary') _
pipeline {
    agent any 
    parameters{
        choice(name: 'action', choices: 'Create\ndelete', description: 'Choose Create/Destroy')
        string(name: 'ImageName',description: "Name of the docker build", defaultValue: 'simpleapp')
        string(name: 'ImageTag',description: "Tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser',description: "Name of the Application", defaultValue: '9886708510')
    }
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage("GIT Checkout"){
            when {expression {params.action == 'Create'}}
            steps{
               script{
                gitCheckout(
                    branch: 'dev', 
                    url: 'https://github.com/eapenm/cicd-microservice-py-app'
                )
               }
            }
        }
    }
}