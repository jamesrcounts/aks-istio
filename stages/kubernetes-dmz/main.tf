locals {
  kube_config = data.azurerm_kubernetes_cluster.aks.kube_admin_config.0
}