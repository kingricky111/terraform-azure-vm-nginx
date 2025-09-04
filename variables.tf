variable "prefix" {
  description = "Name prefix for all resources"
  type        = string
  default     = "devops101"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "address_space" {
  description = "VNet CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "path to your SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "alert_email" {
  description = "Email to notifiy (leave empty to skip creating an Action Group)"
  type        = string
  default     = ""
}