output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "Address space of the virtual network"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnets" {
  description = "Map of subnet name to its id and address space."
  value = {
    for subnet in azurerm_subnet.sbt :
    subnet.name => {
      name          = subnet.name
      id            = subnet.id
      address_space = subnet.address_prefix
    }
  }
}
