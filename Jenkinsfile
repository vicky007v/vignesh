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
                sh 'docker build -t app'
            }
        }
    }
}
        
        
          
