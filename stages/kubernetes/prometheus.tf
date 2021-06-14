resource "helm_release" "prometheus" {
  name      = "prometheus"
  chart     = "../../charts/prometheus-14.1.1"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}