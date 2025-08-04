pipeline {
    agent any

    environment {
        KUBECONFIG = credentials('kubeconfig') // Optional
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/waseem775/frontend-k8s.git', branch: 'main'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yaml'
                sh 'kubectl apply -f kubernetes/service.yaml'
            }
        }
    }
}
