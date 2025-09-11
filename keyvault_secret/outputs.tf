output "ephemeral_secrets_map" {
  description = "Map of ephemeral secrets with readable keys and values."
  value = {
    for secret_name, secret in azurerm_key_vault_secret.ephemeral :
    secret_name => {
      id                       = secret.id
      version                  = secret.version
      name                     = secret.name
      resource_id_with_version = secret.resource_id
    }
  }
  sensitive = true
}

output "sensitive_secrets" {
  description = "Map of secrets with readable keys and values."
  value = {
    for secret_name, secret in azurerm_key_vault_secret.secret :
    secret_name => {
      id                       = secret.id
      name                     = secret.name
    }
  }
  sensitive = true
}
