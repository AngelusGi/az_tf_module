output "login_server" {
  value     = azurerm_container_registry.registry.login_server
  sensitive = true
}

output "login_psw" {
  value     = azurerm_container_registry.registry.admin_password
  ephemeral = true
}

output "login_user" {
  value     = azurerm_container_registry.registry.admin_username
  ephemeral = true
}

output "name" {
  value     = azurerm_container_registry.registry.name
  sensitive = false
}

output "resource_id" {
  value     = azurerm_container_registry.registry.id
  sensitive = true
}
