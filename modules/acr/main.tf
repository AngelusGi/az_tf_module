resource "random_string" "suffix" {
  length = 3
  special = false
  upper = true
  numeric = true
  lower = true
}

locals {
  resource_name = endswith(var.name, "-acr") ? var.name : "${var.name}-${random_string.suffix.result}-acr"
}

resource "azurerm_container_registry" "registry" {
  name                          = local.resource_name
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.enable_admin
  public_network_access_enabled = var.enable_public_network
  anonymous_pull_enabled        = var.enable_anonymous_pull
  retention_policy_in_days      = var.retention_policy_in_days
  tags                          = var.tags
}

