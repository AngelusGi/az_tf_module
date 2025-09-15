resource "random_string" "suffix" {
  length = 3
  special = false
  upper = true
  numeric = true
  lower = true
}

locals {
  resource_name = endswith(var.name, "-vnet") ? var.name : "${var.name}-${random_string.suffix.result}-vnet"
}

resource "azurerm_virtual_network" "main" {
    name                = local.resource_name
    address_space       = var.address_space
    location            = var.location
    resource_group_name = var.rg_name
    tags                = var.tags
}

resource "azurerm_subnet" "main" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = azurerm_virtual_network.main.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
  private_endpoint_network_policies = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  dynamic "delegation" {
    for_each = each.value.delegations
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
  depends_on = [azurerm_virtual_network.main]
}
