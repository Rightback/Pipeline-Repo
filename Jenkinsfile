pipeline {
    agent {
        dockerfile true	
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
    }
}
