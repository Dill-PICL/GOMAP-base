pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    singularity --version
                    ls -lah
                '''
            }
        }
    }
}