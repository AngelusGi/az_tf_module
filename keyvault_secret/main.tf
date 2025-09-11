data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

resource "azurerm_key_vault_secret" "ephemeral_secret" {
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