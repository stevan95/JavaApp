pipeline {
    
    agent { label 'agent-1' }
    
    stages {
        stage('Build') {
            steps {
              sh '''
                  pwd
                  id
                  ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                  ./jenkins/build/build.sh
              '''
            }
        }
    }
}
