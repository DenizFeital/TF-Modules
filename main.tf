#
provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
}
module "subnet" {
  source               = "./subnet"
  name                 = var.subnet_name
  resource_group_location = var.resource_group_location
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}
module "virtual_machine" {
  source               = "./virtual_machine"
  name                 = var.vm_name
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  network_interface_id = "1"
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.mypassword
  subnet_id           = var.azurerm_subnet.main.id
}