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

variable "stack_name" {
  type    = string
  default = "Enterprise-DevOps-Stack"
}

variable "environment" {
  type    = string
  default = "local-production"
}

resource "local_file" "stack_manifest" {
  content  = jsonencode({
    stack       = var.stack_name
    environment = var.environment
    managed_by  = "Terraform"
    components  = ["prometheus", "grafana", "alertmanager", "loki", "nginx"]
  })
  filename = "${path.module}/stack_manifest.json"
}

output "manifest_path" {
  value       = local_file.stack_manifest.filename
  description = "Path to the generated stack manifest JSON file."
}
