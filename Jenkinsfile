pipeline {
    agent { label 'ubuntu' }
    environment {
        CONTAINER = 'gomap'
        IMAGE = 'GOMAP-Base'
        VERSION = 'v1.1.3'   
        FILESHARE_SAS = credentials('fileshareSAS') 
        BLOBSHARE_SAS = credentials('blobstorageSAS') 
    }

    stages { 
        stage('Setup Test Env') {
            when {
                anyOf {
                    changeset 'Singularity'
                    changeset 'Jenkinsfile'
                }
                anyOf {
                    branch 'master'     
                }
            }
            steps {
                echo 'Downloading the Data'
                sh '''
                    du -chs *
                    mkdir -p data/ && 
                    azcopy sync "https://gokoolstorage.blob.core.windows.net/gomap/GOMAP-1.3/pipelineData/${BLOBSHARE_SAS}" data/ --recursive=true &&
                    chmod -R a+rwx data/ &&
                    ls data/
                ''' 
            }
        }

        stage('Build') {
            when {
                anyOf {
                    changeset 'Singularity'
                    changeset 'Jenkinsfile'
                }
                anyOf {
                    branch 'master'
                }
            }
            steps {
                sh '''
                    if [ -d tmp ]
                    then
                        sudo rm -r tmp
                    fi
                    mkdir tmp && \
                    sudo singularity build --tmpdir $PWD/tmp  ${IMAGE}.sif Singularity
                '''
                    // sudo rm -r $PWD/tmp
                    // singularity run ${IMAGE}.sif -h
            }
        }
        stage('Copy Tmp Image') {
            when {
                anyOf {
                    changeset 'Singularity'
                    changeset 'Jenkinsfile'  
                }
                anyOf {
                    branch 'master'  
                }
                anyOf {
                     expression { 
                        sh(returnStdout: true, script: '[ -f "/${CONTAINER}/${IMAGE}/${VERSION}/${IMAGE}.sif" ] && echo "true" || echo "false"').trim()  == 'false' 
                    }
                }
            }
            steps {
                echo 'Image Successfully tested'
                sh '''
                    azcopy cp ${IMAGE}.sif "https://gokoolstorage.blob.core.windows.net//${CONTAINER}/${IMAGE}/${VERSION}/${BLOBSHARE_SAS}"
                '''
                    // rsync -v ${IMAGE}.sif /${CONTAINER}/${IMAGE}/${VERSION}/${IMAGE}.sif
                echo 'Base Image Successfully uploaded'
            }
        }
    }
}

