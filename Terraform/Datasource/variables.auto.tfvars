storage_account_name = "Terraformsa20250403"
tags = {
  Environment = "UAT"
  Project     = "SAANVIKIT"
}
subscription_id         = "2e28c82c-17d7-4303-b27a-4141b3d4088f"
virtual_network_name    = "terraform-vnet"
virtual_network_address = ["10.0.0.0/24"]
subnet_name             = "terraform-subnet"
subnet_address          = ["10.0.0.0/24"]
public_ip_name          = "terraform-public-ip"
nic_name                = "terraform-nic"
nsg_name                = "terraform-nsg"
virtual_machine_name    = "terraform-vm"
virtual_machine_size    = "Standard_DS1_v2"
admin_username          = "terraform"