pipeline {
    agent { label 'builtin' }
    stages {
        stage('Pull Source Code') {
            steps {
                ws('/home/jenkins/workspace') {
                    script {
                        git branch: 'master', url: 'https://github.com/curl/curl'
                    }
                    stash name: 'code', includes: '**/*'
                }
            }
        }
        stage('Build Application') {
            agent { label 'agent' }
            steps {
                ws('/home/jenkins/workspace') {
                    unstash 'code' 
                    script {
                        sh 'autoreconf -fi && ./configure --with-openssl && make'
                        stash name: 'app', includes: '**/*'
                    }
                    
                }
            }
        }
        stage('Execute CURL Tests') {
            agent { label 'agent' }
            steps {
                ws('/home/jenkins/workspace') {
                    script {
                        sh 'echo Testing...'
                        //def curlOutput = sh(script: 'make test', returnStdout: true)
                        //println "CURL Test Results:\n${curlOutput}" 
                    }    
                }
            }
        }
    }
    post {
        success {
            agent { label 'builtin' }
             ws('/home/jenkins/workspace/') {
                script {
                unstash 'app'
                archiveArtifacts artifacts: 'src/curl', allowEmptyArchive: true
                //sh './src/curl https://google.com' // Checking if working
                } 
            }
        }
    }
}
