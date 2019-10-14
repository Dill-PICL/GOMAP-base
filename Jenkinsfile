pipeline {
    agent { label 'ubuntu'}
    environment {
        CONTAINER = 'gomap'
        IMAGE = 'GOMAP-base'
        VERSION = '1.3.1'
        ZENODO_KEY = credentials('zenodo')
    }
    
    stages {
        stage('Build') {
            when { changeset "Singularity"}
            steps {
                sh '''
                    echo ${ZENODO_KEY}
                    singularity --version
                    ls -lah
                    instance_name="GOMAP-base"
                    sudo mkdir tmp
                    sudo singularity build --tmpdir tmp $instance_name.sif Singularity
                '''
            }
        }
        stage('Test') {
            when { changeset "Singularity"}
            steps {
                echo 'Testing..'
                sh '''
                    singularity exec GOMAP-base.sif ls
                '''
            }
        }
        stage('Post') {
            when { changeset "Singularity"}
            steps {
                echo 'Image Successfully Built'
                sh '''
                    python3 zenodo_upload.py ${ZENODO_KEY}
                '''
                azureUpload (storageCredentialId:'gomap', filesPath:"GOMAP-base.sif",allowAnonymousAccess:true, virtualPath:"${IMAGE}/${VERSION}/", storageType:"blob",containerName:'gomap')
            }
        }
    }
}