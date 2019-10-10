def gomap_base_version = '1.3.1'

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
    stage('Post') {
            steps {
                echo 'Image Successfully Built'
                sh '''
                    az   storage account list
                '''
            }
        }
}