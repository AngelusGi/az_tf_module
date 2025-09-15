variable "location" {
  type = string
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
  type    = map(string)
  default = null
}

variable "name" {
  type        = string
  description = "name of AKS instance"
}

variable "sku" {
  type    = string
  default = "Free"
}

variable "default_node_pool_vm_sku" {
  type    = string
  default = "Standard_B2ls_v2"
}

variable "default_node_pool_disk_size" {
  type    = number
  default = 30
}

variable "default_node_pool_max" {
  type    = number
  default = 3
  validation {
    condition     = var.default_node_pool_max >= 1 && var.default_node_pool_max <= 1000
    error_message = "Node pool size size should be in range 1-1000"
  }
}

variable "default_node_pool_min" {
  type    = number
  default = 1
  validation {
    condition     = var.default_node_pool_max >= 1 && var.default_node_pool_max <= 1000
    error_message = "Node pool size size should be in range 1-1000"
  }
}

variable "default_node_pool_count" {
  type    = number
  default = 1
  validation {
    condition     = var.default_node_pool_max >= 1 && var.default_node_pool_max <= 1000
    error_message = "Node pool size size should be in range 1-1000"
  }
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace for AKS monitoring"
  type        = string
}

variable "docker_registry_id" {
  type = string
}

variable "default_nodepool_subnet_id" {
  type = string
}
