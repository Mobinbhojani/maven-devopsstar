pipeline {
    agent any
    stages {
        stage('git-code-download') {
            steps {
                echo "download code from git"
                git branch: 'main', url: 'https://github.com/Mobinbhojani/maven-devopsstar.git'
            }
        }
        stage('build') {
            steps {
                echo "doing build"
                sh '''
                docker build -t mobinbhojani/javaproject-star:${BUILD_NUMBER} .
                docker tag mobinbhojani/javaproject-star:${BUILD_NUMBER} mobinbhojani/javaproject-star:latest
                docker push mobinbhojani/javaproject-star:${BUILD_NUMBER}
                docker push mobinbhojani/javaproject-star:latest
                '''
            }
        }
    }
}
