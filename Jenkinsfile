pipeline {
    agent any
    tools{
        maven 'maven3'
        jdk 'java17'
    }

    stages {
        stage('Code Download from GIT') {
            steps {
                echo 'Hello World'
                git branch: 'main', url: 'https://github.com/Mobinbhojani/maven-devopsstar.git'
            }
        }
        stage('Doing build') {
            steps {
                echo 'Hello World'
                sh 'mvn clean package'
            }
        }
        stage('Archiving the artifact') {
            steps {
                echo 'Hello World'
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }
        stage('build other project') {
            steps {
                echo 'Hello World'
                build wait: false, job: 'deploy-to-dev-pipeline'
            }
        }
    }
}
