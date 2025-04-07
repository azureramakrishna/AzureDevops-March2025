variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the resources."
  type        = map(string)
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "virtual_network_name" {
  type = string
}

variable "virtual_network_address" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_address" {
  type = list(string)
}

variable "public_ip_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "virtual_machine_name" {
  type = string
}

variable "virtual_machine_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}