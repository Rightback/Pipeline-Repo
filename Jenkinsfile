pipeline {
    agent {
        label 'AWS2'
    }
    stages {
	    stage(check) {
            steps {
                sh '''
                    #!/bin/bash
                    echo "hello world"
                '''
            }
        }
        stage('Scan') {
            steps {
                echo 'what you doing'
            }
        }
        stage('Test') {
            steps {
                echo 'Run Test Suites'
            }
        }
        stage('Deploy') {
            steps {
                echo 'sfdx help'
            }
        }
    }
}
