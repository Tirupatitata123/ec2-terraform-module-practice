Pipeline{

  stages{
    stage ("Terraform Init"){
      steps{
        sh 'terraform init'
        sh 'terraform plan' 
      }
    }
      stage ("Choose the options"){
      steps{
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
stage ("Creating Infra"){
      steps{
        sh 'terraform apply --auto-approve'
        
      }
    }
    
  }
}
