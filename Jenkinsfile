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
                    touch testresult.xml
                    #echo "hello world"
		    if grep -q 'type="9"' "./rule/apex_rulesett.xml"; then
		    rm -rf testresult.xml
                    exit 1
                    #echo 'violation1'
                    elif grep -q 'type="3"' "./rule/apex_rulesett.xml"; then
		    rm -rf testresult.xml
                    #echo 'violation4'
		    exit 1
                    else
                    echo 'rule check okay'
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
