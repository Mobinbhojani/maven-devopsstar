pipeline {
    agent any
    stages {
        stage('git-code-download') {
            steps {
                echo "download code from git"
                git branch: 'main', url: 'https://github.com/Mobinbhojani/registration-app.git'
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
        stage('deploy') {
            steps {
                echo "deploying to Docker server"
                sshPublisher(publishers: [
                    sshPublisherDesc(
                        configName: 'docker1',  // Replace with your SSH server configuration name
                        transfers: [
                            sshTransfer(
                                execCommand: '''
                                    docker rm -f myweb || true
                                    docker rmi mobinbhojani/tomcatstar || true
                                    docker run -d -p 80:8080 --name myweb mobinbhojani/tomcatstar
                                ''',
                                execTimeout: 120000 // Timeout in milliseconds (2 minutes)
                            )
                        ],
                        verbose: true  // Set to true for detailed logs
                    )
                ])
            }
        }
    }
}
