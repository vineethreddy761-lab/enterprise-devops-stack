terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

provider "local" {}

resource "local_file" "stack_manifest" {
  content  = "Enterprise DevOps Stack - Terraform Managed"
  filename = "${path.module}/stack_status.txt"
}

output "manifest_status" {
  value = "Terraform infrastructure configuration initialized successfully."
}
