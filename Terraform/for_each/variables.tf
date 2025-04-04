variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the resources."
  type        = map(string)
}

variable "storage_account_names" {
  description = "The name of the storage account."
  type        = list(string)
}
