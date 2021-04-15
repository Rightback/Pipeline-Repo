pipeline {
    agent {
        docker { image 'vasviews/salesforce-dx:1.0.1'}
    }

    stages {
        stage('Scan') {
            steps {
	        sh 'pwd'
		sh 'ls -la'
		sh 'sfdx scanner:run --target ./force-app/main/default/classes/ --pmdconfig ./config/pmd/apex_ruleset.xml'
		sh 'rm -rf testresults.xml'
		sh 'touch testresults.xml'
		sh 'sfdx scanner:run --target ./force-app/main/default/classes/ --pmdconfig ./config/pmd/apex_ruleset.xml --format junit --outfile testresults.xml'
		sh 'cat testresults.xml'
		sh '''
                    #!/bin/bash
                    if grep -q 'type="5"' "./testresults.xml"; then
                    rm -rf testresult.xml
                    #exit 1
                    echo 'violation 5'
                    elif grep -q 'type="99"' "./testresults.xml"; then
                    rm -rf testresult.xml
                    echo 'violation 4'
                    #exit 1
		    elif grep -q 'type="3"' "./testresults.xml"; then
                    rm -rf testresult.xml
                    echo 'violation 3'
		    #exit 1
                    else
                    echo 'rule check okay'
                    rm -rf testresult.xml
                    #exit 0
                    fi
                '''
            }
        }
        stage('Authenticate') {
            steps {
		withCredentials([file(credentialsId: 'jenkins-ssh-key-for-devhub1', variable: 'SSH_KEY_FOR_DEVHUB')]) {
		sh '''
                    #!/bin/bash
		    INSTANCE_URL="https://login.salesforce.com"
                    CLIENT_ID="3MVG9ZF4bs_.MKujkw6ZG8mm2riWYl_WPVCg6Mhj5XjZ0ioVY1heGMLB1ahrkTs9TIZwbZCR5IQMUbkfglBwp"
                    USERNAME="admin2@libertysalesforce.org"
                    JWT_KEY_FILE="$SSH_KEY_FOR_DEVHUB"
                    echo "Start Authentication"
                    sfdx auth:jwt:grant --instanceurl $INSTANCE_URL --clientid $CLIENT_ID --username ${SF_USERNAME} --jwtkeyfile $JWT_KEY_FILE --setdefaultdevhubusername --setalias HubOrg
                    echo "Stop Authentication"
                '''
                }
            }
        }
    }
  post {
      success {
          mail to:"illinoix@yahoo.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
        }
      failure {
          mail to:"illinoix@yahoo.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
      }
   }   	
}
