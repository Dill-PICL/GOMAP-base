pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    singularity --version
                    ls -lah
                    ./build.sh
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                singularity exec GOMAP-base.sif
            }
        }
    }
}