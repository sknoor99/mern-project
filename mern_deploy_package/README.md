# MERN Deployment Package

This package contains all artifacts needed to:
- Deploy a MERN stack on a DigitalOcean Droplet (Docker + Portainer)
- Use GitHub Actions for CI/CD (build & push images)
- Auto-deploy updates via Watchtower or via remote SSH docker-compose pull
- Optionally deploy to Kubernetes (k3s / DigitalOcean Kubernetes) with manifests
- Terraform scripts to create a DigitalOcean Droplet

**Included**
- `docker/` - example Dockerfiles for frontend and backend
- `docker-compose.yml` - orchestrate local or droplet containers
- `.github/workflows/deploy.yml` - GitHub Actions workflow (build & push)
- `k8s/` - Kubernetes manifests (deployments, services, ingress example)
- `terraform/` - Terraform configuration to create a Droplet
- `scripts/` - commands for Portainer, Watchtower & helpful scripts
- `README.md` - this file (usage below)

**How to use (summary)**

1. Provision a Droplet (or use the `terraform/` folder)
2. SSH into the Droplet, install Docker & Docker Compose:
   ```bash
   sudo apt update && sudo apt install -y docker.io docker-compose
   sudo systemctl enable --now docker
   ```
3. Start Portainer:
   ```bash
   docker volume create portainer_data
   docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
   ```
4. (Option A) Watchtower: auto-update running containers when new images are pushed to registry
   ```bash
   docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --interval 60
   ```
5. (Option B) Use GitHub Actions to build & push, then deploy via SSH (workflow shows both approaches).
6. Put repo in GitHub, add required Secrets (see `.github/workflows/deploy.yml` for names).

**Files and where to start**
- Start with `docker/` for Dockerfiles.
- Configure `.github/workflows/deploy.yml` and set your secrets.
- If using Terraform, edit `terraform/variables.tf` and run `terraform init && terraform apply`.

