locals {
  grafana_auth = "${data.kubernetes_secret.grafana.data["admin-user"]}:${data.kubernetes_secret.grafana.data["admin-password"]}"
  grafana_url  = "http://${data.kubernetes_service.grafana.status.0.load_balancer.0.ingress.0.ip}:9090"
  kube_config  = data.azurerm_kubernetes_cluster.aks.kube_admin_config.0
}