
### Milestone: Alerting Pipeline Integration
- Implemented `alertmanager.yml` routing configuration with webhook target endpoints.
- Validated alert rule evaluation directly inside the Prometheus UI (`/alerts`).
- Successfully tested alert firing and webhook delivery using curl simulations and local python listeners.

### Milestone: Infrastructure as Code & Automation Integration
- Integrated Terraform for declarative configuration management.
- Added Ansible playbooks for automated orchestration and environment setup.

### Milestone: Terraform & Ansible Interoperability
- Established a robust pipeline where Terraform provisions and outputs structured JSON metadata (`stack_manifest.json`).
- Configured Ansible playbooks to parse the manifest dynamically, bridging infrastructure provisioning with configuration management.
