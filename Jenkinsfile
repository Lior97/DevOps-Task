pipeline {
    agent {
        label 'agent'
    }
    stages {
        stage('Pull Source Code') {
            steps {
                script {
                    ws('/home/jenkins/workspace') {
                        git branch: 'master', url: 'https://github.com/curl/curl'
                    }
                }
            }
        }
        stage('Build Application') {
            steps {
                script {
                    ws('/home/jenkins/workspace') { 
                        sh 'autoreconf -fi && ./configure --with-openssl && make'
                    }
                }
            }
        }
        stage('Execute CURL Tests') {
            steps {
                script {
                    sh 'echo Testing...'
                    //def curlOutput = sh(script: 'make test', returnStdout: true)
                    //println "CURL Test Results:\n${curlOutput}"  
                }
            }
        }
    }
    post {
        success {
            script {
                archiveArtifacts artifacts: 'src/curl', allowEmptyArchive: true
                sh './src/curl https://google.com'
            }
        }
    }
}
