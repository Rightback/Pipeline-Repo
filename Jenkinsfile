pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }    
    stages { 
        stage('Scan') {
            steps {
                echo 'Scan Stage'
                sh 'pwd'
                sh 'ls -la'
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
