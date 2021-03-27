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
//		sh 'sfdx scanner:run --target "**/default/**" --format "csv" --outfile "pathToFile.csv"'
            }
        }
        stage('Test') {
            steps {
                echo 'Test Stage'
            }
        }
    }
}
