pipeline {
    agent {
        label 'AWS2'
    }
    stages {
        stage(check) {
            steps {
	        sh 'pwd'
		sh 'ls -la'
                sh '''
                    #!/bin/bash
                    echo "hello world"
		    if grep -q 'type="0"' "./rule/apex_rulesett.xml"; then
                    #exit1
                    echo 'violation1'
                    elif grep -q 'type="3"' "./rule/apex_rulesett.xml"; then
                    echo 'violation4'
                    else
                    echo 'we good'
                    #exit 0
                    fi
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
