variable "location" {
  type     = string
}

variable "rg_name" {
  type        = string
  description = "name of the rosource group are contained DevOps Infra resources"
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
}

variable "sku" {
  type     = string
  default  = "standard"
}

variable "tags" {
  type     = map(string)
  nullable = true
}

variable "role_assignments" {
  description = "Map of object ids and IAM Role Assignment for Key Vault access policies"
  type = map(object({
    object_id = string
    role_name = list(string)
  }))
  default = {}
}
