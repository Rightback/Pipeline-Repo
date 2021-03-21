pipeline {
    agent {
        dockerfile {
	    filename 'Dockerfiler'
	    label 'AWS2'
	}
    }
    stages { 
        stage('Scan') {
            steps {
                echo 'Scan Stage'
		sh 'pwd'
            }
        }
        stage('Test') {
            steps {
                echo 'Test Stage'
            }
        }
        stage('Build') {
            steps {
                echo 'Build Stage'
            }
        }
    }
}
