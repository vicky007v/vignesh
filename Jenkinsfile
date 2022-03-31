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
                sh 'docker tag nodeapp:latest public.ecr.aws/k1o3z8e3/nodeapp:latest'
            }
        }
    }
} 
          
