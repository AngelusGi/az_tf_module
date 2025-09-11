variable "location" {
  type     = string
  nullable = false
}

variable "rg_name" {
  type        = string
  description = "name of the rosource group are contained DevOps Infra resources"
  nullable    = false
}

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "name" {
  type        = string
  description = "name of KeyVault"
  nullable    = false
}

variable "sku" {
  type     = string
  default  = "standard"
  nullable = false
}

variable "tenant_id" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "tags" {
  type     = map(string)
  nullable = true
}

variable "access_policies_secrets" {
  description = "Map of object ids and secret permissions for Key Vault access policies"
  type = map(object({
    object_id          = string
    secret_permissions = list(string)
    tenant_id          = string
  }))
  default = {}
}

variable "access_policies_keys" {
  description = "Map of object ids and keys permissions for Key Vault access policies"
  type = map(object({
    object_id       = string
    key_permissions = list(string)
    tenant_id       = string
  }))
  default = {}
}

variable "access_policies_certificates" {
  description = "Map of object ids and certificate permissions for Key Vault access policies"
  type = map(object({
    object_id               = string
    certificate_permissions = list(string)
    tenant_id               = string
  }))
  default = {}
}
