resource "random_string" "suffix" {
  length  = 3
  special = false
  upper   = true
  numeric = true
  lower   = true
}

locals {
  resource_name = endswith(var.name, "-law") ? var.name : "${var.name}-${random_string.suffix.result}-law"
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = local.resource_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}
