# Enterprise DevOps Stack

A robust, multi-node enterprise DevOps environment containerized with Docker Compose, featuring integrated monitoring, visualization tools, and automated system verification workflows.

## Architecture & Stack Components

* **Enterprise Nodes**: Python-based containerized workloads (`enterprise-node-1`, `enterprise-node-2`).
* **Observability**: Prometheus for metrics collection and target scraping.
* **Visualization**: Grafana for dashboarding and operational analytics.
* **Orchestration**: Docker Compose.

## Getting Started

1. Clone the repository:
   ```bash
   git clone [https://github.com/vineethreddy761-lab/enterprise-devops-stack.git](https://github.com/vineethreddy761-lab/enterprise-devops-stack.git)
   cd enterprise-devops-stack```




2. Spin up the entire stack using Docker Compose:
   ```bash
    docker compose up -d```




3. Access the services:

Prometheus UI: http://localhost:9090

Grafana UI: http://localhost:3000
