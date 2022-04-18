pipeline {
    
    agent { label 'agent-1' }
    
    environment {
        IMAGE = 'java-app'
    }

    stages {
        stage('Build') {
            steps {
              sh '''
                  ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                  ./jenkins/build/build.sh
              '''
            }
        }
        stage('Test') {
            steps {
              sh ' ./jenkins/test/mvn.sh mvn test'
            }
        }
        stage('Push') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                       docker login -u $USERNAME -p $PASSWORD   
                       docker tag $IMAGE mstiv95/$IMAGE:${env.BUILD_NUMBER}
                       docker push mstiv95/$IMAGE:${env.BUILD_NUMBER}
                    '''
                 }
            }
        }
    }
}
