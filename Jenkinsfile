pipeline {
    agent any

    stages {
        stage('Pull Source Code') {
            steps {
                git branch: 'master', url: 'https://github.com/curl/curl'
            }
        }

        stage('Build Application') {
            steps {
                sh 'make'  
            }
        }

        stage('Execute CURL Tests') {
            steps {
                def curlOutput = sh(script: 'curl make test', returnStdout: true)
                    echo "CURL Test Results:\n${curlOutput}"  
            }
        }
    }

 
