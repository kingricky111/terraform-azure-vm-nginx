# Project 1: Azure VM with Nginx + Monitoring (Terraform)

## Overview
This project provisions a simple, cost-safe Azure environment using **Terraform**:
- Resource Group
- Networking (VNet, Subnet, NSG, Public IP, NIC)
- Ubuntu Linux VM with cloud-init installing **Nginx**
- Azure Monitor metric alert (CPU > 80%)

### Goals
- Learn provider-agnostic Terraform basics (portable to AWS).
- Practice least-privilege, IaC best practices, and cleanup with `terraform destroy`.
- Produce a professional GitHub-ready portfolio project.

---

## Architecture Diagram
```mermaid
graph TD
    A[Resource Group] --> B[VNet]
    B --> C[Subnet]
    C --> D[NIC]
    D --> E[VM: Ubuntu + Nginx]
    D --> F[Public IP]
    D --> G[NSG: allow 22 & 80]
    E --> H[Azure Monitor Alert: CPU threshold] 
```

 ## repo structure
terraform-azure-vm-nginx/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── cloud-init.yaml
├── monitor.tf
└── README.md

## How to deploy
# 1. Init Terraform
terraform init

# 2. Format & validate
terraform fmt -recursive
terraform validate

# 3. Plan & apply
terraform plan -out tfplan
terraform apply tfplan


## How To Test
#Vist
echo $(terraform output -raw nginx_url)
![Nginx Page](images/ngix.png)

# Stress CPU
$(terraform output -raw ssh_command)
sudo apt-get install -y stress-ng
stress-ng --cpu 2 --timeout 120s --metrics-brief
![CPU Stress Test](images/stress-ng.png)

# Verify Alert
Portal: Azure Monitor → Alerts → Rule: devops101-cpu80
Check state or fired alert instance.
OR view metric graph (Percentage CPU spike).
![CPU Alert](images/alert.png)

##Cleanup
terraform destroy
