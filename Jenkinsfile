pipeline {
    agent any

    stages {
        stage('git') {
            steps {
                git credentialsId: 'vignesh', url: 'https://github.com/vicky007v/vignesh.git'
            }
        }
        
        stage('build') {
            steps {
                sh 'docker build -t app .'
            }
        }

        stage('aws') {
            steps {
                sh 'docker tag app:latest public.ecr.aws/k1o3z8e3/app:latest'
            }
        }
        stage('aws login') {
            steps {
                sh 'aws ecr get-login --no-include-email --region ap-northeast-2'
            }
        }

        stage('aws push') {
            steps {
                sh 'docker push public.ecr.aws/k1o3z8e3/app:latest'
            }
        }
    }
}  
     
