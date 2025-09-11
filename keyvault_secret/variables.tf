variable "kv_name" {
  description = "Name of the Azure Key Vault."
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group containing the Key Vault."
  type        = string
}

variable "ephemeral_content" {
  description = "Content of the ephemeral secret (value to store in Key Vault)"
  type        = string
  default     = ""
}

variable "ephemeral_name" {
  description = "Name of the ephemeral secret in Key Vault"
  type        = string
  default     = ""
}

variable "ephemeral_version" {
  description = "Version of the ephemeral secret (if applicable)"
  type        = number
  default     = 1
}

variable "ephemeral_content_type" {
  description = "Content type of the ephemeral secret (e.g. text/plain)"
  type        = string
  default     = "text/plain"
}

variable "ephemeral_tags" {
  description = "Tags to associate with the ephemeral secret"
  type        = map(string)
  default     = {}
}

variable "ephemeral_not_before_date" {
  description = "Not before date for the ephemeral secret (ISO8601, optional)"
  type        = string
  default     = null
  validation {
    condition     = var.ephemeral_not_before_date == null || can(timeadd(timestamp(), "1s"))
    error_message = "ephemeral_not_before_date must be in valid ISO8601 format"
  }
}

variable "ephemeral_expiration_date" {
  description = "Expiration date for the ephemeral secret (ISO8601, optional)"
  type        = string
  default     = null
  validation {
    condition     = var.ephemeral_expiration_date == null || can(timeadd(timestamp(), "1s"))
    error_message = "ephemeral_expiration_date must be in valid ISO8601 format"
  }
}

variable "secret_content" {
  description = "Contenuto del segreto standard (valore da salvare in Key Vault)"
  type        = string
  default     = null
}

variable "secret_name" {
  description = "Nome del segreto standard in Key Vault"
  type        = string
  default     = null
}

variable "secret_content_type" {
  description = "Content type del segreto standard (es. text/plain)"
  type        = string
  default     = "text/plain"
}

variable "secret_tags" {
  description = "Tags da associare al segreto standard"
  type        = map(string)
  default     = {}
}

variable "secret_not_before_date" {
  description = "Data di inizio validità del segreto standard (ISO8601, opzionale)"
  type        = string
  default     = null
  validation {
    condition     = var.secret_not_before_date == null || can(timeadd(timestamp(), "1s"))
    error_message = "secret_not_before_date deve essere in formato ISO8601 valido"
  }
}

variable "secret_expiration_date" {
  description = "Data di scadenza del segreto standard (ISO8601, opzionale)"
  type        = string
  default     = null
  validation {
    condition     = var.secret_expiration_date == null || can(timeadd(timestamp(), "1s"))
    error_message = "secret_expiration_date deve essere in formato ISO8601 valido"
  }
}
