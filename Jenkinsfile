pipeline {
    agent {
        docker {
            image '0754631/agk-1st:sfvaimage1'
	    registryUrl 'https://hub.docker.com/'
	    registryCredentialsId '37909e5b-3e72-47ff-82de-986cbf3ab573'
        }
    }    
    stages { 
        stage('Scan') {
            steps {
                echo 'Scan Stage'
                sh 'pwd'
                sh 'ls -la'
		sh 'sfdx plugins'
                sh 'sfdx scanner:run --target "./testfiles/*" --pmdconfig "./rule/apex_rulesett.xml"'
            }
        }
        stage('Test') {
            steps {
                echo 'Test Stage'
            }
        }
    }
}
