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
                    instance_name="GOMAP-base"
                    sudo mkdir tmp
                    sudo singularity build --tmpdir tmp $instance_name.sif Singularity
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
                azureUpload (storageCredentialId:'gomap', filesPath:"GOMAP-base.sif",allowAnonymousAccess:true, virtualPath:"${IMAGE}/${VERSION}/", storageType:"blob",containerName:'gomap')
            }
        }
    }
}