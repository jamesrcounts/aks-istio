data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
}

data "kubernetes_secret" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "istio-system"
  }
}

data "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "istio-system"
  }
}