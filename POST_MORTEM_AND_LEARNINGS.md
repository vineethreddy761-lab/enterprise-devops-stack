# Enterprise DevOps Project - Post-Mortem & Learnings Log

This document tracks engineering challenges, errors, root causes, and resolutions encountered during the automated deployment of the Enterprise Hybrid-Fabric Infrastructure Stack.

---
## Log Entry Template
- **Date/Phase:** 
- **Component:** (e.g., Terraform, Ansible, Jenkins, Docker)
- **Error / Symptom:** 
- **Root Cause:** 
- **Remediation / Fix:** 
- **Key Learning:** 

---
- **Date/Phase:** June 2026 / Phase 2 (Terraform)
- **Component:** Terraform Docker Provider API Mismatch
- **Error / Symptom:** `client version 1.41 is too old. Minimum supported API version is 1.44`
- **Root Cause:** Older provider version `3.0.1` was incompatible with the host's modern Docker daemon API.
- **Remediation / Fix:** Upgraded the `kreuzwerker/docker` provider version requirement to `~> 4.0` in `main.tf` and reinitialized via `terraform init -upgrade`.
- **Key Learning:** Keeping Terraform provider plugins updated ensures compatibility with modern host container daemon API versions.
