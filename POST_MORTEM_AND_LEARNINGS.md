# Post-Mortem & Technical Learnings: Enterprise DevOps Stack

## Overview
This document outlines the technical challenges, root causes, and resolutions encountered during the deployment of the containerized enterprise DevOps stack featuring Prometheus, Grafana, resource-constrained Python nodes, and an Nginx reverse proxy.

---

## Incident 1: Nginx Port Binding Conflicts (Port 80)
- **Symptom:** `curl` returned HTTP status `000` (connection refused/failed).
- **Root Cause:** Host port `80` was bound or conflicted with existing system services.
- **Resolution:** Validated host port usage via `ss`, verified container binding behavior, and mapped container port `80` to an available unprivileged host port or direct interface binding where applicable.

---

## Incident 2: Nginx Configuration Syntax Errors
- **Symptom:** Container exited immediately with `emerg "events" directive is not allowed here`.
- **Root Cause:** Placing top-level directives (`events {}` or `http {}`) inside files mounted in `/etc/nginx/conf.d/`, which are automatically included *within* the main Nginx configuration's `http` block.
- **Resolution:** Stripped outer blocks from `nginx.conf`, ensuring it contains only valid `server {}` blocks and location rules.

---

## Incident 3: Upstream Resolution & 502 Bad Gateway
- **Symptom:** Returning `502 Bad Gateway` or `52 Empty reply from server`.
- **Root Cause:** Nginx resolving upstream container hostnames (`grafana`, `prometheus`) at startup before they are fully initialized, or using dynamic variables (`proxy_pass $variable`) without an explicit resolver directive.
- **Resolution:** Used direct service name resolution (`proxy_pass http://grafana:3000;`) combined with proper path-prefix stripping (`rewrite ^/prometheus/(.*)$ /$1 break;`) to allow graceful runtime proxying.

---

## Key Takeaways
1. **Startup Order & Readiness:** Containerized observability stacks require brief initialization windows (e.g., Grafana plugin setup) before upstream proxies can successfully establish TCP connections.
2. **Path Rewriting Rules:** When proxying subpaths to services expecting root URIs, regex rewrite rules combined with clean `proxy_pass` syntax prevent URI duplication and empty replies.
3. **State Management:** Local infrastructure state files (such as Terraform state) must be explicitly ignored in `.gitignore` to prevent unintended version control pollution and merge conflicts.

---

## Incident 4: Docker Compose & Terraform Container Naming Conflicts
- **Symptom:** `Error response from daemon: Conflict. The container name is already in use.`
- **Root Cause:** Overlapping container naming definitions between Terraform-managed resources and Docker Compose stack deployments.
- **Resolution:** Ensured proper ownership by tearing down overlapping deployments (`terraform destroy` or `docker compose down`) prior to switching orchestration tools.

## Incident 5: YAML Indentation & Mapping Syntax Errors
- **Symptom:** `yaml: line X: mapping values are not allowed in this context`.
- **Root Cause:** Incorrect indentation or unescaped inline additions inside `docker-compose.yml`.
- **Resolution:** Maintained strict 2-space YAML formatting and validated structure using `docker compose config` before restarting services.
