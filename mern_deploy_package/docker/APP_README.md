# Sample MERN App (minimal)

This sample is intentionally minimal:
- backend: Express server in `docker/backend`
- frontend: React app in `docker/client` served by nginx

To run locally with Docker Compose:
1. Create a `.env` file with MONGO_URL (optional)
2. Run:
   ```bash
   docker-compose up --build
   ```

API will be available at `http://localhost/api/hello` (proxied by nginx) or `http://localhost:5000/api/hello` direct.

