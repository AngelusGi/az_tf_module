resource "random_string" "suffix" {
  length  = 3
  special = false
  upper   = true
  numeric = true
  lower   = true
}

locals {
  resource_name = endswith(var.name, "-aks") ? var.name : "${var.name}-${random_string.suffix.result}-aks"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                              = local.resource_name
  location                          = var.location
  resource_group_name               = var.rg_name
  dns_prefix                        = local.resource_name
  sku_tier                          = var.sku
  role_based_access_control_enabled = true
  cost_analysis_enabled             = true
  image_cleaner_enabled             = true
  tags                              = var.tags

  default_node_pool {
    name                 = "default"
    vm_size              = var.node_sku
    os_disk_size_gb      = var.node_disk_size
    max_count            = var.node_count_max
    min_count            = var.node_count_min
    node_count           = var.node_count
    auto_scaling_enabled = var.auto_scaling_enabled
    os_disk_type         = "Managed"
    vnet_subnet_id       = var.default_nodepool_subnet_id
  }

  oms_agent {
    log_analytics_workspace_id      = var.log_analytics_workspace_id
    msi_auth_for_monitoring_enabled = true
  }

  identity {
    # use of managed identity for the cluster
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "registry_pull" {
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity.object_id
  role_definition_name             = "AcrPull"
  scope                            = var.docker_registry_id
  skip_service_principal_aad_check = false
}
