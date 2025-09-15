variable "location" {
  type     = string
}

variable "default_node_pool_auto_scaling" {
  type    = bool
  default = false
}

variable "rg_name" {
  type        = string
  description = "name of the resource group containing DevOps Infra resources"
}

variable "tags" {
  type     = map(string)
  default  = null
}

variable "name" {
  type        = string
  description = "name of AKS instance"
}

variable "sku" {
  type     = string
  default  = "Free"
}

variable "default_node_pool_vm_sku" {
  type     = string
  default  = "Standard_B2ls_v2"
}

variable "default_node_pool_disk_size" {
  type     = number
  default  = 30
}

variable "default_node_pool_max" {
  type     = number
  default  = 3
}

variable "default_node_pool_min" {
  type     = number
  default  = 1
}

variable "default_node_pool_count" {
  type     = number
  default  = 1
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace for AKS monitoring"
  type        = string
}

variable "docker_registry_id"{
  type        = string
}

variable "default_nodepool_subnet_id"{
  type        = string
}
