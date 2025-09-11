variable "kv_name" {
  type        = string
  description = "name of the KeyVault"
}

variable "rg_name" {
  type        = string
  description = "name of the resource group containing the KeyVault"
}

variable "secret_value" {
  type      = string
  ephemeral = true
}

variable "secret_version" {
  type    = number
  default = 1
}

variable "content_type" {
  description = "Specifies the content type for the Key Vault Secret."
  type        = string
  default     = "text/plain"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "not_before_date" {
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
  validation {
    condition     = can(regex("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z$", var.not_before_date)) || var.not_before_date == null
    error_message = "not_before_date must be in the format Y-m-d'T'H:M:S'Z'"
  }
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
  validation {
    condition     = can(regex("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z$", var.expiration_date)) || var.expiration_date == null
    error_message = "expiration_date must be in the format Y-m-d'T'H:M:S'Z'"
  }
}
