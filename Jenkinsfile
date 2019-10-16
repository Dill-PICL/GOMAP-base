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
            agent { label 'ubuntu'}
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
            post{
                success {
                    echo "Image Successfully built"
                }
            }
        }
        stage('Test') {
            agent { label 'ubuntu'}
            when { changeset "Singularity"}
            steps {
                echo 'Testing..'
                sh '''
                    singularity exec GOMAP-base.sif ls
                '''
            }
            post {
                success {
                    echo "Image Successfully tested"
                    azureUpload(storageCredentialId:'gomap', filesPath:"GOMAP-base.sif",allowAnonymousAccess:true, virtualPath:"${IMAGE}/${VERSION}/", storageType:"file",containerName:'gomap')
                    echo "Image Successfully uploaded"
                }
            }
        }
        stage('Post') {
            agent { label 'master'}
            when { changeset "Singularity"}
            steps {
                echo 'Image Successfully Built'
                sh '''
                    echo python3 zenodo_upload.py ${ZENODO_KEY} /mnt/gomap/${IMAGE}/${VERSION}/${IMAGE}.simg
                '''
            }
        }
    }
}