# azure terraform provider version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

# Azure terraform provider configuration
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# Terraform backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "storage-resource-group"
    storage_account_name = "saanvikit"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "remote.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

module "remote_storage" {
  source = "git::https://github.com/azureramakrishna/AzureDevops-March2025.git//Terraform/Count"

  resource_group_name  = var.resource_group_name
  location             = var.location
  tags                 = var.tags
  storage_account_name = var.storage_account_name
  count_value          = var.count_value
}