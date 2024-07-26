# Create Network Interface with Count
resource "azurerm_network_interface" "my_nic_withcount" {
  count               = 3
  name                = "${var.network_interface_name}${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    primary                       = true
  }
}


# Create Network Interface
resource "azurerm_network_interface" "my_nic" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    primary                       = true
  }
}

# Create Virtual Machine
resource "azurerm_windows_virtual_machine" "my_vm" {
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.my_nic.id]
  size                  = var.virtual_machine_size
  admin_username = var.username
  admin_password = var.password
  
  os_disk {
    name                 = var.disk_name
    caching              = "ReadWrite"
    storage_account_type = var.redundancy_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  tags = {
    Owner = var.owner_tags
    Env   = var.env_tags
  }
}
