# Enterprise DevOps Stack

A fully containerized enterprise DevOps stack orchestrated via Docker Compose and Terraform, featuring strict resource constraints, service isolation, complete observability (Prometheus, Grafana, Loki, Promtail, cAdvisor), and automated CI/CD validation.

## Architecture & Services

- **Nginx (`nginx-proxy`)**: Reverse proxy routing entrypoint on port `80`.
- **Grafana (`grafana`)**: Visualizes metrics and logs, accessible via `/`.
- **Prometheus (`prometheus`)**: Scrapes telemetry data, accessible via `/prometheus/`.
- **Grafana Loki (`loki`)**: Centralized log aggregation engine.
- **Promtail (`promtail`)**: Agent responsible for gathering and shipping container logs to Loki.
- **cAdvisor (`cadvisor`)**: Provides granular container resource usage metrics.
- **Python Worker Nodes (`enterprise-node-1`, `enterprise-node-2`)**: Resource-constrained target workloads managed via Terraform.

## Endpoints

- Grafana UI: `http://localhost/`
- Prometheus UI: `http://localhost/prometheus/`

## CI/CD Automation
- Validated automatically via GitHub Actions on every pull request and push to `main` (checking Terraform configurations and Docker Compose syntax).

## Recent Updates: Alerting & Observability
- Integrated **Prometheus Alertmanager** on port `9093` for alert routing and webhook notification handling.
- Added custom Prometheus alert rules (`alert.rules.yml`) to monitor container CPU usage thresholds.
- Configured volume mounts in `docker-compose.yml` for seamless rule and configuration loading.

## Infrastructure as Code (Terraform & Ansible)
- **Terraform (HCL):** Added infrastructure provisioning configuration under `/terraform`.
- **Ansible:** Added configuration management playbooks and inventory under `/ansible`.
