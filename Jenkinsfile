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
                sh '''
                    singularity exec GOMAP-base.sif ls
                '''
            }
        }
    }
}