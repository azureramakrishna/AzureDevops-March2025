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
    storage_account_name = "saanvikit"              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "test.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

module "vm" {
  source = "../../Modules/VirtualMachine"

  resource_group_name     = var.resource_group_name
  location                = var.location
  storage_account_name    = var.storage_account_name
  tags                    = var.tags
  subscription_id         = var.subscription_id
  virtual_network_name    = var.virtual_network_name
  virtual_network_address = var.virtual_network_address
  subnet_name             = var.subnet_name
  subnet_address          = var.subnet_address
  public_ip_name          = var.public_ip_name
  nsg_name                = var.nsg_name
  virtual_machine_name    = var.virtual_machine_name
  virtual_machine_size    = var.virtual_machine_size
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  nic_name                = var.nic_name
}