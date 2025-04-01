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