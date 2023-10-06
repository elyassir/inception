# inception

This repository contains the 42-project "inception" (containerized services) source files and Docker setup. It provides Dockerfiles, service configurations and helper scripts to build a small multi-container stack using Docker and docker-compose.

Here’s a clean version of your note with that addition:

---

> **Location note:**
> Most service definitions and helper scripts live under `srcs/` and `srcs/requirements/`.
>
> Please fill the `.env` file with your own values under `srcs/.env`.
> A sample file is provided at `srcs/.env.sample`.

---

## Repository layout (important paths)

- `Makefile` — project-level helper targets (if present).
- `srcs/docker-compose.yml` — the compose stack used to orchestrate the services.
- `srcs/requirements/` — per-service Docker builds & configs. Example services:
  - `mariadb/` — MariaDB Dockerfile + tools
  - `nginx/` — Nginx Dockerfile + tools
  - `wordpress/` — WordPress Dockerfile + tools
  - `redis/`, `portainer/`, `adminer/`, `ftp-server/`, `static-website/` and others under `bonus/`

Each service folder usually includes:
- `Dockerfile` — how the service image is built.
- `tools/` — helper scripts for building or running the service.
- `conf/` — configuration files for the service (where applicable).

## Prerequisites

- Linux (or macOS/Windows WSL)
- Docker (tested with Docker Engine)
- docker-compose (or use the Docker Compose plugin: `docker compose`)
- make (optional, if you want to use the `Makefile` in the repo)

Ensure your user can run docker commands or run commands with `sudo`.

## Quick start

This section shows the simplest way to build and run the stack using the provided compose file.

1. Build the service images and start the stack (from the repository root):

```zsh
# If you have docker-compose v1 installed
docker-compose -f srcs/docker-compose.yml up --build -d

```

2. Check running containers:

```zsh
docker ps
```

3. Stop and remove the stack:

```zsh
# using docker-compose v1
docker-compose -f srcs/docker-compose.yml down
```

If this repository contains a useful `Makefile` at the root (it does), look for targets such as `build`, `up`, `down`, `clean` and `re` that might wrap the commands above.

## Development notes

- Many service folders include `tools/script.sh` — use those to seed data, initialize the service or aid debugging.
- Config files for services (for example `vsftpd.conf`, `nginx` config or `default` for static site) live in their respective `conf/` directories.
- When editing Dockerfiles or configs, rebuild the images before restarting the stack.

## Common tasks

- Rebuild and restart the stack:

```zsh
# rebuild and restart all services
docker-compose -f srcs/docker-compose.yml up --build -d

# or using the Makefile (if target exists)
make re
```

- View logs of a specific service (replace `<service_name>` with the name from the compose file):

```zsh
docker-compose -f srcs/docker-compose.yml logs -f <service_name>
```

- Enter a running container:

```zsh
docker exec -it <container_name_or_id> /bin/sh
# or /bin/bash if available
```

## Troubleshooting

- Permission denied on docker: ensure your user is in the `docker` group or use `sudo`.

- Ports already in use: check `docker ps` and `ss -tulpn` to find processes occupying required ports.

- If a service fails on first run, check the service logs with `docker compose logs <service>` to get details.
