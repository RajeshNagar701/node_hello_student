pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/RajeshNagar701/node_hello_student.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker ps -q --filter "publish=3000" | xargs -r docker stop'
                    sh 'docker ps -aq --filter "publish=3000" | xargs -r docker rm'
                    sh 'docker build -t node_hello_student:latest .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 node_hello_student:latest'
                }
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
    }
}

