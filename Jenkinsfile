pipeline {
    agent any

    stages {
        stage('git') {
            steps {
                git credentialsId: 'vignesh', url: 'https://github.com/vicky007v/vignesh.git'
            }
        }
     stages {
        stage('build') {
            steps {
                sh "npm install"
            }
        }
    }
}        
        
        
          
