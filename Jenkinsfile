pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code from Git repository...'
                checkout scm
            }
        }

        stage('Terraform Provisioning') {
            steps {
                dir('terraform') {
                    echo 'Initializing and applying Terraform infrastructure...'
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Ansible Configuration & Hardening') {
            steps {
                dir('ansible') {
                    echo 'Executing Ansible configuration management playbook...'
                    sh 'ansible-playbook -i inventory.ini playbooks/site.yml'
                }
            }
        }
    }

    post {
        success {
            echo 'Enterprise pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check system logs and post-mortem tracker.'
        }
    }
}
