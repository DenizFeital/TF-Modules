# Create Resource Group
resource "azurerm_resource_group" "my_resource_group" {
  name     = var.name
  location = var.location
}