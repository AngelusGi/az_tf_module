variable "kv_name" {
  type        = string
  description = "name of the KeyVault"
}

variable "rg_name" {
  type        = string
  description = "name of the resource group containing the KeyVault"
}

variable "ephemeral_secrets" {
  description = "Map of ephemeral secrets for Key Vault"
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
