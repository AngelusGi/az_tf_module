output "uri" {
  value     = azurerm_key_vault.kv.vault_uri
  sensitive = false
}

output "resource_id" {
  value     = azurerm_key_vault.kv.id
  sensitive = true
}

output "name" {
  value     = azurerm_key_vault.kv.name
  sensitive = false
}
