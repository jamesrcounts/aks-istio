resource "helm_release" "istio_base" {
  name      = "istio-base"
  chart     = "../../charts/istio-1.10.1/manifests/charts/base"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}