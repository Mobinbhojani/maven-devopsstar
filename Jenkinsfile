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
                docker build -t mobinbhojani/tomcatstar:${BUILD_NUMBER} .
                docker tag mobinbhojani/tomcatstar:${BUILD_NUMBER} mobinbhojani/tomcatstar:latest
                docker push mobinbhojani/tomcatstar:${BUILD_NUMBER}
                docker push mobinbhojani/tomcatstar:latest
                '''
            }
        }
        stage('deploy to k8s') {
            steps {
                script {
                    withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                        sh '''
                        kubectl apply -f deployment.yaml
                        kubectl apply -f service.yaml
                        '''
                    }
                }
            }
        }
    }
}
