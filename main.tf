provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "../resource_group"
  name     = "my-resource-group"
  location = "East US"
}

module "subnet" {
  source               = "../subnet"
  name                 = "my-subnet"
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "my-nic"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.subnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

module "virtual_machine" {
  source               = "../virtual_machine"
  name                 = "my-vm"
  location             = module.resource_group.resource_group_location
  resource_group_name  = module.resource_group.resource_group_name
  network_interface_id = azurerm_network_interface.nic.id
  vm_size              = "Standard_DS1_v2"
  admin_username       = "adminuser"
  admin_password       = "Password1234!"
}
