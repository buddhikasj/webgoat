//Reference : https://medium.com/@gustavo.guss/jenkins-building-docker-image-and-sending-to-registry-64b84ea45ee9
pipeline {
    environment {
   // registry = "gustavoapolinario/docker-test"
    registryCredential = 'docker-hub'
    customImage = ''
    image_name = 'buddhikasj88/contrast-HTTPserver:'+"${env.BUILD_ID}"
    //JENKINS_PATH = twistlockScan ca: '', cert: '', compliancePolicy: 'critical', containerized: false, dockerAddress: 'unix:///var/run/docker.sock', gracePeriodDays: 3, ignoreImageBuildTime: false, image: "${env.image_name}", key: '', logLevel: 'true', policy: 'critical', requirePackageUpdate: true, timeout: 10
    }
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checkout..'
                echo 'Already done..'
         //       checkout scm
            }
        }
        stage('Building Image') {
            steps{
                script {
               //     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') 

               customImage = docker.build("buddhikasj88/contrast-httpserver:${env.BUILD_ID}")

                    /* Push the container to the custom Registry */
                //    customImage.push('latest') 
                }
              }
        }
        /*stage('Scan Aqua'){
            steps{
                script{
                    aqua locationType: 'local', localImage: '"${env.image_name}"', hideBase: false, notCompliesCmd: '', onDisallowed: 'ignore', showNegligible: false
                    //twistlockScan ca: '', cert: '', compliancePolicy: 'critical', containerized: false, dockerAddress: 'unix:///var/run/docker.sock', gracePeriodDays: 3, ignoreImageBuildTime: false, image: "${env.image_name}", key: '', logLevel: 'true', policy: 'critical', requirePackageUpdate: true, timeout: 10
                }
            }
        } */
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        customImage.push()
                        customImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker run --rm -p 80:8080 --name testcontainer -d buddhikasj88/contrast-httpserver:latest'
            }
        }
        
    }
}
