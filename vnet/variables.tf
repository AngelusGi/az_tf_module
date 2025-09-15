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

variable "address_space" {
    description = "Address space for the virtual network"
    type        = list(string)
    default     = ["192.168.0.0/23"]
}

variable "tags" {
    description = "Tags to apply to resources"
    type        = map(string)
    default     = null
}

variable "subnets" {
  description = "List of subnets to create in the virtual network"
  type = list(object({
    name = string
    address_prefixes = list(string)
    service_endpoints = list(string)
    private_endpoint_network_policies = string
    private_link_service_network_policies_enabled = string
    delegations = list(object({
      name    = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    }))
  }))
  default = []
}
