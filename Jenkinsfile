pipeline {
    
    agent { label 'agent-1' }
    
    stages {
        steps {
            sh '''
                ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                ./jenkins/build/build.sh
            '''
        }
    }
}