data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

resource "azurerm_key_vault_secret" "ephemeral" {
  count            = (var.ephemeral_secret_name != null) ? 1 : 0
  name             = var.ephemeral_secret_name
  value_wo_version = var.ephemeral_secret_version
  value_wo         = var.ephemeral_secret_content
  key_vault_id     = data.azurerm_key_vault.kv.id
  content_type     = var.ephemeral_secret_content_type
  tags             = var.ephemeral_secret_tags
  not_before_date  = var.ephemeral_secret_not_before_date
  expiration_date  = var.ephemeral_secret_expiration_date

  depends_on = [data.azurerm_key_vault.kv]
}

resource "azurerm_key_vault_secret" "secret" {
  count           = (var.ephemeral_secret_name != null) ? 1 : 0
  name            = var.secret_name
  value           = var.secret_content
  key_vault_id    = data.azurerm_key_vault.kv.id
  content_type    = var.secret_content_type
  tags            = var.secret_tags
  not_before_date = var.secret_not_before_date
  expiration_date = var.secret_expiration_date
  depends_on      = [data.azurerm_key_vault.kv]
}
