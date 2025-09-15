variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "name" {
  description = "Name of the virtual network"
  type        = string
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "daily_quota_gb" {
  type        = number
  default     = 1
  description = "daily_quota_gb: default 1GB, unlimited is -1"
}

variable "retention_in_days" {
  type    = number
  default = 30
  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "The retention period must be between 30 and 730 days."
  }
}

variable "tags" {
  type     = map(string)
  nullable = true
}
