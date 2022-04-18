pipeline {
    
    agent { label 'agent-1' }
    
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
              sh ' ./Jenkins/test/mvn.sh mvn test'
            }
        }
    }
}
