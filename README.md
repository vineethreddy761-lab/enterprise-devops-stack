# Enterprise DevOps Hybrid-Fabric Stack

An end-to-end, production-grade GitOps platform engineering pipeline demonstrating infrastructure provisioning, configuration management, CI/CD automation, and observability.

## Architecture Stack
- **Infrastructure as Code:** Terraform (`kreuzwerker/docker`) managing multi-node Docker environments.
- **Configuration Management:** Ansible for system hardening, directory structuring, and package management.
- **CI/CD Automation:** Declarative Jenkins pipeline and GitHub Actions workflow.
- **Observability:** Prometheus scrape configuration for telemetry.
- **Engineering Rigor:** Strict conventional commits and a local `POST_MORTEM_AND_LEARNINGS.md` log.

## Quick Start
Run the master startup script to initialize and provision the entire stack:
