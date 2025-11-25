# GitHub Secrets & Deployment Options

You can choose one of two deployment strategies after GitHub builds & pushes images:

## Option A: Watchtower (automatic)
- Push images to Docker Hub (workflow already does)
- Run Watchtower on your Droplet; it periodically checks for new images and updates containers.
  - Use the `scripts/start_services.sh` script to start it.

Required secrets (for build only):
- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN

## Option B: SSH remote deploy (recommended for controlled rollout)
- Set `DEPLOY_VIA_SSH` secret to `true` in GitHub repo settings.
- Add these secrets:
  - `DEPLOY_HOST` - public IP of your droplet
  - `DEPLOY_USER` - username (e.g., ubuntu or root)
  - `DEPLOY_SSH_PRIVATE_KEY` - private key (PEM) for SSH
  - `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` (for build only)

Workflow will run `docker-compose pull && docker-compose up -d` on the droplet.

