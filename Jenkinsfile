pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "Demo_App"
        ECR_PASS = "730335448540.dkr.ecr.us-east-1.amazonaws.com"
        ECR_URL = "730335448540.dkr.ecr.us-east-1.amazonaws.com"
        AWS_REGION = "us-east-1"
        K8S_FILE = "Kubernetes"
    }

    stages {
        stage('Build Docker Image With Tag') {
            steps {
                 script {
                    echo "test"
                    sh '''
                    IMAGE_TAG="${IMAGE_TAG}"
                    ls
                    docker build -t ${ECR_URL}/${IMAGE_TAG} ./todo-app
                    '''
                }
            }
        }
        
        stage('Login Aws ECR') {
            steps {
                script {
                     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '730335480302']]){
                    sh ''' 
                    ECR_PASS="${ECR_PASS}"
                    AWS_REGION="${AWS_REGION}"
                    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_PASS}
                    '''
                    }
                }
            }
        }
        stage(' Push Docker Image to ECR ') {
            steps {
                script {
                    sh ''' 
                    ECR_URL="${ECR_URL}"
                    echo "Push Docker image to ECR"
                    docker push ${ECR_URL}/${IMAGE_TAG}
                     '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '730335480302']]){
                    
                    sh '''
                    aws eks update-kubeconfig --region us-east-1 --name demo
                    kubectl apply -f ${K8S_FILE}
                        '''
                     }
                }
            }
        }
    }
}