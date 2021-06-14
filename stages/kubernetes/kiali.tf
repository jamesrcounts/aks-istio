resource "helm_release" "kiali" {
  name      = "kiali-server"
  chart     = "../../charts/kiali-server-1.35.0"
  namespace = kubernetes_namespace.istio_system.metadata.0.name

  set {
    name  = "auth.strategy"
    value = "anonymous"
  }
}