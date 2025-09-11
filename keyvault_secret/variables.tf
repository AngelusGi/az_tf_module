variable "kv_name" {
  type        = string
  description = "name of the KeyVault"
}

variable "rg_name" {
  type        = string
  description = "name of the resource group containing the KeyVault"
}

variable "secrets_metadata" {
  type = map(object({
    name            = string
    content_type    = optional(string)
    tags            = optional(map(string))
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  default = {}
}

variable "secrets_values" {
  type = map(string)
  sensitive = true
  default = {}
}

variable "ephemeral_secrets" {
  description = "Map of ephemeral secrets for Key Vault. Do NOT use ephemeral or sensitive values as keys."
  type = map(object({
    name            = string
    secret          = string
    version         = string
    content_type    = optional(string)
    tags            = optional(map(string))
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  default = {}
}
