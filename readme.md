# DevOps Infra App

🛠️ A complete DevOps project: a minimal web application built with Node.js + Express, containerized with Docker, automated with GitHub Actions, and infrastructure managed via Terraform on AWS.

---

## 📦 Description

**DevOps Infra App** is a demo application designed to simulate the role of a DevOps Engineer working on a real project.  
It will serve as the foundation for:

- CI/CD automation  
- Deployment to AWS EC2 server  
- Containerization with Docker  
- Infrastructure as Code using Terraform  
- Monitoring with Prometheus + Grafana  
- Comprehensive technical documentation  

The application is a simple **Node.js + Express** server with a single endpoint (`GET /`) that returns a plain text message — used for testing and health checks.

---

## 🧰 Technologies Used

- Node.js & Express  
- Git + GitHub  
- Docker  
- GitHub Actions (CI/CD)  
- AWS (EC2, IAM, S3, etc.)  
- Terraform  
- Prometheus + Grafana  
- Nginx, SSH, Linux  

---

# Step 2 — Dockerization

In this step, we will:

- Create a Dockerfile to containerize the Node.js application  
- Use Docker Compose for easier local development  
- Build and run the Docker container locally  
- Update README.md with detailed instructions on Docker usage  

This will allow us to run the app consistently across environments and prepare for automated deployment.

# Step 3 — AWS CLI & IAM User Setup

In this step, we:

- Created a dedicated IAM user in AWS for programmatic access  
- Configured AWS CLI locally to use this IAM user  
- Verified CLI access to the AWS account  

---

### What we did

1. Created an IAM user named `alex-devops` with **programmatic access** enabled (access keys).  
2. Assigned the **AdministratorAccess** policy to this user for full permissions (for learning/demo purposes).  
3. Downloaded the Access Key ID and Secret Access Key for this user.  
4. Installed and configured AWS CLI locally by running `aws configure` and providing the credentials, default region (`eu-central-1`), and JSON output format.  
5. Verified the setup with the command:

```bash
aws sts get-caller-identity
```
