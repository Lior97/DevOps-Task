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
        // stage('Build Application') {
        //     agent { label 'agent' }
        //     steps {
        //         ws('/home/jenkins/workspace') {
        //             unstash 'code' 
        //             script {
        //                 sh 'ls -l'
        //                 sh 'autoreconf -fi && ./configure --with-openssl && make'
        //             }
                    
        //         }
        //     }
        // }
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
            agent { label 'agent' }
            ws('/home/jenkins/workspace') {
                script {
                    sh 'ls -l'
                    //stash name: 'app', includes: 'src/*'
                } 
                archiveArtifacts artifacts: 'src/curl', allowEmptyArchive: true
            }
            // agent { label 'builtin' }
            // ws('/home/jenkins/workspace') {
            //     script {
            //         sh 'ls -l'
            //         sh 'pwd'
            //         sh 'whoami'
            //         unstash 'app'
            //         archiveArtifacts artifacts: 'src/curl', allowEmptyArchive: true
            //         sh './src/curl https://google.com'
            //     }    
            // }
        }
    }
}
