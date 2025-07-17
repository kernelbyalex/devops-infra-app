# DevOps Infra App

🛠️ A complete DevOps project: a minimal Node.js + Express web application, containerized with Docker, automated with GitHub Actions, and infrastructure managed via Terraform on AWS.

---

## 📦 Project Overview

**DevOps Infra App** is a demonstration project designed to simulate the workflow of a DevOps Engineer in a real-world environment.  
It serves as a foundation for:

- CI/CD automation  
- Deployment on AWS EC2  
- Containerization using Docker  
- Infrastructure as Code with Terraform  
- Monitoring with Prometheus + Grafana  
- Comprehensive technical documentation  

The application is a simple **Node.js + Express** server with a single endpoint (`GET /`) returning a plain text message for testing and health checks.

---

## 🧰 Technologies Used

- Node.js & Express  
- Docker  
- Git & GitHub  
- GitHub Actions (CI/CD)  
- AWS (EC2, IAM, S3)  
- Terraform  
- Prometheus + Grafana  
- Nginx, SSH, Linux  

---

## 🚀 Progress Summary

### 1. Application Setup

- Created a minimal Node.js + Express application with basic routing.  
- Initialized the project with `package.json` and installed dependencies.  
- Successfully ran the application locally (`npm start`) on port 3000.

### 2. Docker Containerization

- Built a `Dockerfile` based on `node:18-alpine` to containerize the application.  
- Explained Dockerfile steps: working directory setup, copying source code, installing dependencies, exposing port, and start command.  
- Tested container locally to ensure consistent environment.  
- Updated documentation with Docker usage instructions.

### 3. AWS CLI & IAM User Setup

- Created an IAM user in AWS with programmatic access keys.  
- Encountered initial `SignatureDoesNotMatch` errors due to invalid or expired credentials.  
- Regenerated Access Key and Secret Access Key, saved securely as CSV.  
- Configured AWS CLI locally with the new credentials and region (`eu-central-1`) using:

  ```bash
  aws configure
  ```

- Verified AWS CLI authentication by running:
  ```bash
  aws sts get-caller-identity
  ```

