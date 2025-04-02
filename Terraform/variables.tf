variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "saanvikit-rg"
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "SAANVIKITSA01042025"
}

variable "tags" {
  description = "Tags to assign to the resources."
  type        = map(string)
  default = {
    Environment = "Dev"
    Project     = "Terraform"
  }
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  default     = "2e28c82c-17d7-4303-b27a-4141b3d4088f"
}

variable "virtual_network_name" {
  type    = string
  default = "saanvikit-vnet"
}

variable "virtual_network_address" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet_name" {
  type    = string
  default = "saanvikit-subnet"
}

variable "subnet_address" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "public_ip_name" {
  type    = string
  default = "saanvikit-public-ip"
}

variable "nic_name" {
  type    = string
  default = "saanvikit-nic"
}

variable "nsg_name" {
  type    = string
  default = "saanvikit-nsg"
}

variable "virtual_machine_name" {
  type    = string
  default = "saanvikit-vm"
}

variable "virtual_machine_size" {
  type    = string
  default = "standard_d2s_v3"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}