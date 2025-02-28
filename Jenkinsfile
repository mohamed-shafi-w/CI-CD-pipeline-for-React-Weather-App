pipeline {
    agent any
    
    tools{
        nodejs 'Nodejs-22'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/mohamed-shafi-w/weather-app.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }
        
        stage('Docker Build & Push') {
            steps {
                withDockerRegistry(credentialsId: env.DOCKER_CREDENTIALS_ID, url: 'https://index.docker.io/v1/'){
                bat 'docker build -t weather-application:latest .'
                bat 'docker tag weather-application:latest shafi2000/weather-application:latest'
                bat 'docker push shafi2000/weather-application:latest'
               }
            }
        }
        
         stage('Deploy') {
            steps {
                bat 'docker run -d -p 3000:3000 shafi2000/weather-application:latest'
            }
        }
    }
}