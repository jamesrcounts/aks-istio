resource "helm_release" "jaeger" {
  name      = "jaeger"
  chart     = "../../charts/jaeger-0.46.0"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}