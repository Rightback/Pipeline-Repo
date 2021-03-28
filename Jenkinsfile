pipeline {
    stages {
	    stage(check) {
            steps {
                bash '''
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
