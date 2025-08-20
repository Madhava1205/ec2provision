pipeline {
    agent any

    stages {
        stage('Terraform Init & Plan') {
            steps {
                ansiColor('xterm') {
                    sh '''
                        terraform init
                        terraform plan -out=tfplan
                    '''
                }
            }
        }

        stage('Approval') {
            steps {
                script {
                    input message: "Approve to apply?"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                ansiColor('xterm') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
