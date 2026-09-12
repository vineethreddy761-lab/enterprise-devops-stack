# Enterprise DevOps Stack: Exhaustive Project Journey & Execution Report

## 1. Project Overview & Architecture Vision
The primary goal of this project was to architect, build, document, and deploy a production-grade enterprise DevOps stack from scratch. The stack integrates modern infrastructure-as-code, container orchestration, secure proxy routing, full-stack observability (metrics, logs, and container telemetry), and automated CI/CD validation.

---

## 2. Phase-by-Phase Integration Roadmap

### Phase 1: Core Networking & Reverse Proxy
- **Components Integrated:** Docker Bridge Network (`enterprise-net`), **Nginx** reverse proxy (`nginx-proxy`).
- **Execution & Impact:** Established an isolated network bridge for secure service communication. Configured Nginx as a single entrypoint on port `80` to route traffic cleanly to internal services like Grafana (`/`) and Prometheus (`/prometheus/`).

### Phase 2: Infrastructure as Code & Workloads
- **Components Integrated:** Terraform, **Python Worker Nodes** (`enterprise-node-1`, `enterprise-node-2`).
- **Execution & Impact:** Provisioned resource-constrained container workloads and network architecture declaratively using Terraform, ensuring repeatable and version-controlled infrastructure deployment.

### Phase 3: Core Observability Stack (Metrics & Dashboards)
- **Components Integrated:** **Prometheus**, **Grafana**, and Automated Data Source Provisioning.
- **Execution & Impact:** Deployed Prometheus to scrape telemetry and Grafana to visualize metrics. Configured automated provisioning so that data sources and dashboards load seamlessly without manual UI configuration.

### Phase 4: Advanced Container Telemetry & Log Aggregation
- **Components Integrated:** **cAdvisor**, **Grafana Loki**, and **Promtail**.
- **Execution & Impact:** 
  - Added **cAdvisor** to stream granular container-level CPU, memory, and network utilization metrics directly into Prometheus.
  - Implemented **Grafana Loki** as a log aggregation engine paired with **Promtail** to collect and ship container log streams, completing the observability triad.

### Phase 5: CI/CD Pipeline Automation
- **Components Integrated:** **GitHub Actions** (`ci.yml`).
- **Execution & Impact:** Shifted left on error detection by automating validation checks (`terraform validate` and `docker compose config`) on every push to `main`.
