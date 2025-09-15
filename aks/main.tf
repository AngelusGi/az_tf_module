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
  cost_analysis_enabled             = var.cost_analysis_enabled
  role_based_access_control_enabled = true
  image_cleaner_enabled             = true
  image_cleaner_interval_hours      = var.image_cleaner_interval_hours
  tags                              = var.tags

  default_node_pool {
    name                 = "default"
    vm_size              = var.default_node_pool_vm_sku
    os_disk_size_gb      = var.default_node_pool_disk_size
    max_count            = var.default_node_pool_max
    min_count            = var.default_node_pool_min
    node_count           = var.default_node_pool_count
    auto_scaling_enabled = var.default_node_pool_auto_scaling
    vnet_subnet_id       = var.default_nodepool_subnet_id
    tags                 = var.default_node_pool_tags
    os_disk_type         = "Managed"
  }

  oms_agent {
    log_analytics_workspace_id      = var.log_analytics_workspace_id
    msi_auth_for_monitoring_enabled = true
  }

  identity {
    # use of managed identity for the cluster
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "cilium"
    network_plugin_mode = "overlay"
    network_data_plane  = "cilium"
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    pod_cidr            = var.pod_cidr
    outbound_type       = "loadBalancer"
    load_balancer_sku   = "standard"
  }
}

resource "azurerm_role_assignment" "registry_pull" {
  scope                            = var.docker_registry_id
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  skip_service_principal_aad_check = false

  depends_on = [azurerm_kubernetes_cluster.k8s]
}

resource "azurerm_role_assignment" "users" {
  for_each             = var.role_assignments
  scope                = azurerm_kubernetes_cluster.k8s.id
  role_definition_name = each.value.role_name
  principal_id         = each.value.object_id

  depends_on = [azurerm_kubernetes_cluster.k8s]
}
