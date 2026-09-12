
### Incident Postmortem: YAML Syntax & Volume Mounts
- **Issue:** Prometheus failed to detect custom alert rules ("No rules found") due to missing volume mapping in `docker-compose.yml`, followed by inline YAML syntax errors.
- **Resolution:** Cleaned up service block definitions, correctly mounted `./alert.rules.yml`, and validated configurations using `docker compose config`.

### Engineering Note: State and Manifest Refactoring
- **Transition:** Migrated from plain text status files (`stack_status.txt`) to structured JSON manifests (`stack_manifest.json`) using Terraform resource replacement.
- **Benefit:** Enabled programmatic parsing across configuration management tools (Ansible) for automated validation.
