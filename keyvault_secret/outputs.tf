output "resource_id" {
  value     = azurerm_key_vault_secret.ephemeral_secret.id
  sensitive = true
}

output "secret_version" {
  value     = azurerm_key_vault_secret.ephemeral_secret.version
  sensitive = false
}

output "resource_id_with_version" {
  value     = azurerm_key_vault_secret.ephemeral_secret.resource_id
  sensitive = true
}
