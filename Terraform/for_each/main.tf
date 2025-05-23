# Azure terraform provider configuration
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# Terraform Backend

terraform {
  backend "azurerm" {
    resource_group_name  = "saanvikit"
    storage_account_name = "saanvikit"                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "foreach.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Create a storage account
resource "azurerm_storage_account" "sa" {
  for_each                 = toset(var.storage_account_names)
  name                     = lower(each.value)
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
