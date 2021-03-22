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
            steps {
                shagent(credentials : ['962e8e0f-0275-4e54-a1b8-324001e86113']) {
                    sh 'scp -r /home/dockeruser/testpipeline ec2-user@34.229.57.228:/home/ec2-user'
                 }
            } 
	}
       
    }
}
