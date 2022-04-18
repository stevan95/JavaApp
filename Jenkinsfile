pipeline {
    
    agent { label 'agent-1' }
    
    environment {
        IMAGE = 'java-app'
        BUILDVERSION = "${BUILD_NUMBER}"
        PRODUCTION= '10.0.2.6'
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
                       docker tag $IMAGE mstiv95/$IMAGE:$BUILDVERSION
                       docker push mstiv95/$IMAGE:$BUILDVERSION
                    '''
                 }
            }
        }
        stage('Deploy') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                       ssh $PRODUCTION "docker login -u $USERNAME -p $PASSWORD; docker run -d mstiv95/$IMAGE:$BUILDVERSION"
                    '''
              }     
            }
        }
    }
}
