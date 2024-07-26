output "vnet_name_out" {
    value = azurerm_virtual_network.my_virtual_network.id
}

output "subnet_name_out" {
    value = azurerm_subnet.my_subnet.id
}

output "subnet_id_out" {
    value = azurerm_subnet.my_subnet.id
}