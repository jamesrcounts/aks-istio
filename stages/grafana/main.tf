locals {
  kube_config = data.azurerm_kubernetes_cluster.aks.kube_admin_config.0
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

resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "Prometheus"
  url  = "http://prometheus-server/"
}

resource "grafana_folder" "istio" {
  title = "Istio"
}