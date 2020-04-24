#!groovy
    node('test-webapp-1') {

        def DOCKER_HUB_ACCOUNT = 'admin'
        def DOCKER_IMAGE_NAME = 'kubelb01:5000/nginx-example'
        def K8S_DEPLOYMENT_NAME = 'test-webapp-1'
        def POD_NAMESPACE = 'default'

        stage('Clone test-webapp-1 App Repository') {
            checkout scm
            
            container('docker') {
                stage('Docker Build & Push Current & Latest Versions') {
                    sh ("docker build -t ${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER} -f applications/test-webapp-1/Dockerfile applications/test-webapp-1/")
                    sh ("docker push ${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
                    sh ("docker tag ${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER} ${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:latest")
                    sh ("docker push ${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:latest")
                }
            }

            container('kubectl') {
                stage('Deploy New Build To Kubernetes') {
                    sh ("kubectl set image -n ${POD_NAMESPACE} deployment/${K8S_DEPLOYMENT_NAME} ${K8S_DEPLOYMENT_NAME}=${DOCKER_HUB_ACCOUNT}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }

        }        
    }
