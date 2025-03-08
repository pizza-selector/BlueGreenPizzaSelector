# Mastering GitHub Actions: CI/CD & Monitoring

## Overview
Welcome to the codebase for [**Mastering GitHub Actions: CI/CD & Monitoring**](https://www.udemy.com/course/mastering-github-actions-cicd-monitoring/?referralCode=5D595337BD9A388D52FA) on Udemy! This monorepo contains the complete source code for a **full-stack application**, demonstrating CI/CD pipelines with **GitHub Actions** for infrastructure, backend, and frontend deployments.

## Repository Structure
This project follows a **monorepo** architecture with the following directories:

```
.
├── infrastructure/   # Terraform code for cloud infrastructure
├── pizza-backend/         # Java-based backend service (Spring Boot)
├── pizza-frontend/        # Angular frontend application
├── .github/workflows/ # GitHub Actions CI/CD pipelines
└── README.md        # Project documentation
```

## Technologies Used
- **GitHub Actions** - CI/CD automation
- **Terraform** - Infrastructure as Code (IaC)
- **Java (Spring Boot)** - Backend service
- **Angular** - Frontend application
- **Docker** - Containerization

## Prerequisites
Ensure you have the following installed:
- **Git**
- **Docker**
- **Terraform** (latest version)
- **Java 21+** (for the backend)
- **Node.js & Angular CLI** (for the frontend)

## CI/CD with GitHub Actions
This project includes **GitHub Actions workflows** for:
- **Automated Testing** (unit & integration tests)
- **Infrastructure Deployment** (Terraform apply)
- **Backend CI/CD** (Build, Test, Dockerize, Deploy)
- **Frontend CI/CD** (Build, Test, Deploy to S3/Cloud)

### Running Workflows Manually
- Navigate to **GitHub Actions** tab in your repository
- Select the workflow you want to trigger
- Click "Run workflow"

## Contributing
Feel free to fork this repository and submit pull requests! We welcome contributions for:
- Improving CI/CD workflows
- Adding new monitoring features (prometheus, grafana, loki)
- Enhancing application performance

