data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

resource "azurerm_key_vault_secret" "ephemeral" {
  for_each         = var.ephemeral_secrets
  name             = each.value.name
  value_wo_version = each.value.version
  value_wo         = each.value.secret
  key_vault_id     = data.azurerm_key_vault.kv.id
  content_type     = each.value.content_type
  tags             = each.value.tags
  not_before_date  = each.value.not_before_date
  expiration_date  = each.value.expiration_date
  
  depends_on       = [data.azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "secret" {
  for_each         = var.secrets_metadata
  name             = each.value.name
  value            = var.secrets_values[each.key]
  key_vault_id     = data.azurerm_key_vault.kv.id
  content_type     = lookup(each.value, "content_type", "text/plain")
  tags             = lookup(each.value, "tags", {})
  not_before_date  = lookup(each.value, "not_before_date", null)
  expiration_date  = lookup(each.value, "expiration_date", null)
  depends_on       = [data.azurerm_key_vault.kv]
}
