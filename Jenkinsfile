pipeline {
    agent any

    stages {

        stage('Terraform Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
            }
        }

        stage('Manual Approval') {
            steps {
                script {
                    def choice = input(
                        message: 'Do you want to apply Terraform changes?',
                        ok: 'Submit',
                        parameters: [
                            choice(
                                name: 'Confirm',
                                choices: ['Yes', 'No'],
                                description: 'Select Yes to proceed'
                            )
                        ]
                    )

                    if (choice == 'No') {
                        error("❌ User selected NO. Stopping pipeline.")
                    }
                }
            }
        }

        stage('Terraform Apply -auto') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage ('Distroy infra'){
            steps{
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}
