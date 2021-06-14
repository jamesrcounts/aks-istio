resource "helm_release" "prometheus" {
  name      = "prometheus"
  chart     = "../../charts/prometheus-14.1.1"
  namespace = kubernetes_namespace.istio_system.metadata.0.name

  set {
    name  = "server.service.servicePort"
    value = 9090
  }

  set {
    name  = "server.fullnameOverride"
    value = "prometheus"
  }
}