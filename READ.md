# Terraform: Azure VM with Nginx + Monitoring

## Project 1 (Azure-first, AWS-compatible)
Creates RG → VNet/Subnet → NSG → Linux VM (cloud-init installs Nginx) → Azure Monitor alert (CPU > 80%).

### How to Deploy (quick start)
```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out tfplan
terraform apply tfplan
