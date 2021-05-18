pipeline {
    agent {
        any
        }
    }
    environment {
        CI = 'true'
    }
    stages {

        stage('Cloning Git') {
            steps {
                git 'https://github.com/****'
                }
        }
        stage('Run tests') {
            steps {
                go test -v -timeout 30m
            }
        }
        
        post {
            success {
                 bitbucketStatusNotify buildState: "SUCCESSFUL"
                 }
            failure {
                bitbucketStatusNotify buildState: "FAILED"
                }
        }
    }
}