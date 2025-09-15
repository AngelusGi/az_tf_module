output "login_server" {
  value     = data.azurerm_kubernetes_cluster.k8s.fqdn
  sensitive = false
}

output "kubeconfig" {
  value     = data.azurerm_kubernetes_cluster.k8s.kube_config
  sensitive = true
}

output "network_profile" {
  value     = data.azurerm_kubernetes_cluster.k8s.network_profile
  sensitive = false
}

output "subnet" {
  value = data.azurerm_subnet.aks.address_prefix
  sensitive = false
}

output "kube_config" {
  description = "Kube config for AKS cluster"
  value = azurerm_kubernetes_cluster.k8s.kube_config_raw
  ephemeral = true
}
