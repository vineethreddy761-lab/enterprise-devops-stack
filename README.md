# Enterprise DevOps Stack

A fully containerized enterprise DevOps stack orchestrated via Docker Compose, featuring strict resource constraints, service isolation, Prometheus/Grafana observability, and an Nginx reverse proxy.

## Architecture & Services

- **Nginx (`nginx-proxy`)**: Acts as the reverse proxy routing entrypoint on port `80`.
- **Grafana (`grafana`)**: Visualizes metrics and dashboards, accessible via the root path `/`.
- **Prometheus (`prometheus`)**: Scrapes telemetry data, accessible via the proxied prefix path `/prometheus/`.
- **Python Nodes (`enterprise-node-1`, `enterprise-node-2`)**: Resource-constrained target workloads.

## Network & Security
- All services communicate over an isolated Docker bridge network (`enterprise-net`).
- Strict CPU and memory limits are enforced across all containers via Docker Compose resource constraints.

## Endpoints

- Grafana UI: `http://localhost/`
- Prometheus UI: `http://localhost/prometheus/`
