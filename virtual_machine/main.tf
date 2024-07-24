# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "${prefix}-vm"
  admin_username        = "azureuser"
  admin_password        = "${mypassword}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = myterraform-nic.id
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "${prefix}-Disk"
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
