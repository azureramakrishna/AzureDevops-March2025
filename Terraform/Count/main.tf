# Azure terraform provider configuration
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = "d46e6eca-91fd-4b00-8467-61efcb383cc8"
  client_secret   = null
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
}

# Terraform Backend

terraform {
  backend "azurerm" {
    resource_group_name  = "storage-resource-group"
    storage_account_name = "saanvikit"            # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"              # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "sa.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
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
  name                     = "${lower(var.storage_account_name)}${count.index + 1}"
  count                    = var.count_value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}