pipeline {
    agent any
    environment {
        CONTAINER = 'gomap'
        IMAGE = 'GOMAP-base'
        VERSION = '1.3.1'
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
                azureUpload {
                    storageCredentialId 'gomap'
                    filesPath "GOMAP-base.sif"
                    allowAnonymousAccess true
                    virtualPath "${CONTAINER}/${IMAGE}/${VERSION}/" 
                }
            }
        }
    }
}