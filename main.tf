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
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.subnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

module "virtual_machine" {
  source               = "./virtual_machine"
  name                 = var.vm_name
  location             = module.resource_group.resource_group_location
  resource_group_name  = module.resource_group.resource_group_name
  network_interface_id = azurerm_network_interface.nic.id
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
}
