pipeline {
    
    stages {
        // Step 1
        stage('SCM') {
                steps {
                    git 'https://github.com/Sachin19191/java-proj.git'
                }        
        }
        // Step 2
        stage('Build by Maven') {
                steps {
                    sh 'mvn clean package'
                }
        }
        
        // Step 3
        stage('Build docker image') {
                steps {
                    sh "sudo docker build -t sachinkumar69/javaapp:v1 ."
                }
        }
        
        // Step 4
        stage('Push docker image') {
                steps {
                    withCredentials([string(credentialsId: 'DOCKER_PASSWORD', variable: 'VAR_FOR_DOCKERPASS')]) {
                    sh "sudo docker login -u sachinkumar69 -p $VAR_FOR_DOCKERPASS"
                    }
                    sh "sudo docker push sachinkumar69/javaapp:v1"
                }
        }
        
        // Step 5 
        stage('Deploy Java App') {
                steps {
                        sh "sudo docker rm -f myjavaapp"
                        sh "sudo docker run  -d -p 1222:8080 --name myjavaapp sachinkumar69/javaapp:v1"
                }
        }
    }
}