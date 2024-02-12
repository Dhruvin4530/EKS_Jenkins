properties([ parameters([
  string( name: 'CLUSTER_NAME', defaultValue: ''),
  string( name: 'AWS_REGION', defaultValue: ''),
  string( name: 'WORKER_NODE_COUNT', defaultValue: ''),
  string( name: 'WORKER_NODE_SIZE', defaultValue: ''),
]), pipelineTriggers([]) ])

// Environment Variables.
env.region = AWS_REGION
env.cluster_name = CLUSTER_NAME
env.instance_count = WORKER_NODE_COUNT
env.instance_size = WORKER_NODE_SIZE

pipeline {
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
    }

    agent any
    
    stages {
        stage('Git Checkout'){
            steps{
                git branch: 'main', credentialsId: 'cred', url: 'https://github.com/Dhruvin4530/EKS_Jenkins'
            }
        }
        stage('Terraform init'){
            steps{
              sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.cluster_name='${env.cluster_name}' && export TF_VAR_env.instance_count='${env.instance_count}' && export TF_VAR_env.instance_size='${env.instance_size} && terraform init"
            }
        }
        stage('Terraform plan'){
            steps{
              sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.cluster_name='${env.cluster_name}' && export TF_VAR_env.instance_count='${env.instance_count}' && export TF_VAR_env.instance_size='${env.instance_size} && terraform plan"
            }
        }
        stage('Approval') {
            steps {
                script {
                    def userInput = input(id: 'Confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'Confirm'] ])
                }
            }
        }
        stage('Terraform apply'){
            steps{
               sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.cluster_name='${env.cluster_name}' && export TF_VAR_env.instance_count='${env.instance_count}' && export TF_VAR_env.instance_size='${env.instance_size} && terraform apply -input=false myplan"   
            }
        }
    }
  }
