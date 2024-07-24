# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "dfa-vm"
  admin_username        = var.admin_username
  admin_password        = var.mypassword
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.nic_name.id
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "dfa-os-Disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}