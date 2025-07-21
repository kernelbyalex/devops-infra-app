# Infra by Alex 🚀

A complete DevOps infrastructure project using:
- **Terraform** for provisioning AWS infrastructure
- **Docker** for containerizing a Node.js app
- **GitHub Actions** for CI/CD deployment
- **Bastion Host** for secure SSH access
- **Elastic IPs** for persistent connectivity

---

## ✅ Infrastructure Components

- `main.tf`: Provisions app EC2 instance, EIP, S3 bucket
- `bastionhost.tf`: Bastion host with locked-down SSH rules
- `outputs.tf`: Displays public IPs of the bastion and app server
- `.github/workflows/deploy.yml`: CI/CD pipeline via SSH tunnel

---

## 🔐 Security Highlights

- Bastion host restricts SSH to a specific IP
- App server accepts SSH only from the Bastion
- SSH keys are securely injected via GitHub Secrets
- No public access to the app server

---

## 🚀 Deployment Pipeline

1. Push to `master` triggers GitHub Actions
2. GitHub opens an SSH tunnel through Bastion
3. Code is copied and Docker app is built on the EC2 instance

---

## 📦 Cleanup

Use `cleanup.sh` to destroy all resources.

---

## 🛠 Future Improvements

- Reverse proxy with Traefik
- Docker Swarm / ECS / Kubernetes
- HTTPS with Let's Encrypt
- Monitoring with Uptime Kuma or Grafana


