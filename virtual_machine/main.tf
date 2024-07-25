# Create virtual machine
#added again
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "DFA-vm"
  admin_username        = var.admin_username
  admin_password        = "Password@1650"
  location              = "East-US"
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.azurerm_windows_virtual_machine.main.id
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "DFA-Disk"
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