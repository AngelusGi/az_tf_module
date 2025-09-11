resource "random_string" "suffix" {
  length  = 3
  special = false
  upper   = true
  numeric = true
  lower   = true
}

locals {
  resource_name = endswith(var.name, "-kv") ? var.name : "${var.name}-${var.tags.env}-${random_string.suffix.result}-kv"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                          = local.resource_name
  location                      = var.location
  resource_group_name           = var.rg_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  sku_name                      = var.sku
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  enable_rbac_authorization     = true
}

resource "azurerm_key_vault_access_policy" "secret_permissions" {
  for_each           = var.access_policies_secrets
  key_vault_id       = azurerm_key_vault.kv.id
  tenant_id          = each.value.tenant_id
  object_id          = each.value.object_id
  secret_permissions = each.value.secret_permissions
  depends_on         = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_access_policy" "certificate_permissions" {
  for_each                = var.access_policies_certificates
  key_vault_id            = azurerm_key_vault.kv.id
  tenant_id               = each.value.tenant_id
  object_id               = each.value.object_id
  certificate_permissions = each.value.certificate_permissions
  depends_on              = [azurerm_key_vault.kv]
}

resource "azurerm_key_vault_access_policy" "keys_permissions" {
  for_each        = var.access_policies_keys
  key_vault_id    = azurerm_key_vault.kv.id
  tenant_id       = each.value.tenant_id
  object_id       = each.value.object_id
  key_permissions = each.value.key_permissions
  depends_on      = [azurerm_key_vault.kv]
}
