output "vnet_id" {
    description = "ID of the virtual network"
    value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
    description = "Name of the virtual network"
    value       = azurerm_virtual_network.main.name
}

output "vnet_address_space" {
    description = "Address space of the virtual network"
    value       = azurerm_virtual_network.main.address_space
}

output "subnet_ids" {
    description = "IDs of all subnets created in the virtual network"
    value       = { for sbt_name, sbt_obj in azurerm_subnet.main : sbt_name => sbt_obj.id }
}

output "subnet_names" {
    description = "Names of all subnets created in the virtual network"
    value       = { for sbt_name, sbt_obj in azurerm_subnet.main : sbt_name => sbt_obj.name }
}

output "subnet_address_spaces" {
    description = "Address space (CIDR blocks) of every subnet"
    value       = { for sbt_name, sbt_obj in azurerm_subnet.main : sbt_name => sbt_obj.address_prefixes }
}
