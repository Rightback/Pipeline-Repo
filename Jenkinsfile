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
	stage('Deploy') {
            steps{
                sshagent(['962e8e0f-0275-4e54-a1b8-324001e86113']) {
		    sh 'pwd'
                    sh 'scp -r */testpipeline ec2-user@34.229.57.228:/home/ec2-user'
                }
            } 
	}   
    }
}
