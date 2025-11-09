# Digital Product Website: AWS EKS, ECR, and CI/CD

This project provisions a production-ready AWS infrastructure for a digital product website using Terraform, Kubernetes, and GitHub Actions. It includes:

- Modular VPC, subnets, NAT, IGW, and route tables
- Two EKS clusters (prod & staging, multi-AZ)
- ECR repository for container images
- Automated CI/CD pipeline with GitHub Actions
- Kubernetes manifests for deployment, service, and ingress

## Prerequisites
- AWS account with admin permissions
- Terraform >= 1.0
- kubectl, awscli, Docker (for local testing)
- GitHub repository with secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

## Infrastructure Setup
1. **Clone this repo and review Terraform files.**
2. **Initialize and apply Terraform:**
   ```sh
   terraform init
   terraform apply -auto-approve
   ```
   This will create VPC, subnets, ECR, and two EKS clusters.

## CI/CD Pipeline
- On every push to `main`, GitHub Actions will:
  1. Build and tag Docker image
  2. Push image to ECR
  3. Deploy to both EKS clusters (prod & staging)

## Kubernetes Deployment
- Edit `k8s/deployment.yaml` if you want to change the container image or settings.
- The workflow will automatically update the image tag and apply manifests.
- `service.yaml` exposes the app via LoadBalancer.
- `ingress.yaml` is provided for ALB or ingress controller setups (optional).

## Directory Structure
```
.
├── 01-vpc.tf
├── 02-subnets.tf
├── ...
├── 10-ecr.tf
├── 20-eks.tf
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── .github/
    └── workflows/
        └── deploy.yml
```

## Notes
- Make sure your EKS clusters are ACTIVE before deploying.
- Add your AWS credentials as GitHub repository secrets.
- For custom domains, configure your DNS and update `ingress.yaml`.

---

**This setup follows AWS and Kubernetes best practices for high availability, security, and automation.**
