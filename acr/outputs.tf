variable "location" {
  type     = string
}

variable "rg_name" {
  type        = string
  description = "name of the rosource group are contained DevOps Infra resources"
}

variable "name" {
  type        = string
  description = "name of ACR"
}

variable "sku" {
  type     = string
  default  = "Basic"
}

variable "enable_public_network"{
  type     = bool
  default  = false
}

variable "enable_admin"{
  type     = bool
  default  = false
}

variable "enable_anonymous_pull"{
  type     = bool
  default  = false
}

variable "tags"{
  type     = map(string)
  nullable = true
}

variable "retention_policy_in_days" {
  type    = number
  default = 7
}
