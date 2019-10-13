pipeline {
    agent any
    environment {
        CONTAINER = 'gomap'
    }
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
        stage('Post') {
            steps {
                echo 'Image Successfully Built'
                sh '''
                    azcopy 
                '''
            }
        }
        stage('Archive') {
            archiveArtifacts "GOMAP-base.sif"
        }
    }
}