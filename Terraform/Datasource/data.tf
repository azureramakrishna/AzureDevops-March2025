data "azurerm_key_vault" "keyvault" {
  name                = "saanvikit-kv"
  resource_group_name = "storage-resource-group"
}

data "azurerm_key_vault_secret" "secret" {
  name         = "VMPassword"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

#Use this data source to access information about an existing Resource Group.
data "azurerm_resource_group" "rg" {
  name = "test"
}