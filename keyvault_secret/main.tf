data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

ephemeral "azurerm_key_vault_secret" "ephemeral_secret" {
  for_each         = var.access_policies_keys
  name             = each.value.name
  value_wo_version = each.value.version
  value_wo         = each.value.secret
  key_vault_id     = data.azurerm_key_vault.kv.id
  
  depends_on       = [data.azurerm_key_vault.kv]
}
