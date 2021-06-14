resource "helm_release" "grafana" {
  name      = "grafana"
  chart     = "../../charts/grafana-6.12.1"
  namespace = kubernetes_namespace.istio_system.metadata.0.name

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}