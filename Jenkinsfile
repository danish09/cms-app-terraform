node {
      checkout scm

    docker.withServer('tcp://10.0.1.99:4243') {
        docker.image('danish09/cms-build-node:latest')
    }
    stage('pre-setup') {
      
        sh 'echo "setup actions go here"'
        deleteDir()
      
    }
    stage('AWS Deployment') {
      
      withCredentials([
         usernamePassword(credentialsId: 'EMEFCONSUL_AWS_ACCESS_ID', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
         usernamePassword(credentialsId: 'GMAIL_GIT_ACCESS_ID', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
         ]) {
             //sh 'rm -rf node-app-terraform'
             sh 'git clone https://github.com/danish09/cms-app-terraform.git .'
             sh '''
             terraform init
             terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
             '''
          }
      
      }
}
