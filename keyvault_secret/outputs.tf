output "ephemeral_secret_id" {
  description = "ID of the ephemeral secret."
  value       = try(azurerm_key_vault_secret.ephemeral[0].id, null)
  sensitive   = true
}

output "ephemeral_secret_name" {
  description = "Name of the ephemeral secret."
  value       = try(azurerm_key_vault_secret.ephemeral[0].name, null)
}

output "ephemeral_secret_version" {
  description = "Version of the ephemeral secret."
  value       = try(azurerm_key_vault_secret.ephemeral[0].version, null)
}

output "secret_id" {
  description = "ID of the standard secret."
  value       = try(azurerm_key_vault_secret.secret[0].id, null)
  sensitive   = true
}

output "secret_name" {
  description = "Name of the standard secret."
  value       = try(azurerm_key_vault_secret.secret[0].name, null)
}
