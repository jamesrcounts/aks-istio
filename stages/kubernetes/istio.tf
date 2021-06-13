// https://istio.io/latest/docs/setup/install/helm/
// helm install istio-base manifests/charts/base -n istio-system
resource "helm_release" "istio_base" {
  name      = "istio-base"
  chart     = "../../charts/istio-1.10.1/manifests/charts/base"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}

// helm install istiod manifests/charts/istio-control/istio-discovery \
//     -n istio-system
resource "helm_release" "istiod" {
  name      = "istiod"
  chart     = "../../charts/istio-1.10.1/manifests/charts/istio-control/istio-discovery"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}

// helm install istio-ingress manifests/charts/gateways/istio-ingress \
//     -n istio-system
resource "helm_release" "istio_ingress" {
  name      = "istio-ingress"
  chart     = "../../charts/istio-1.10.1/manifests/charts/gateways/istio-ingress"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}

// helm install istio-egress manifests/charts/gateways/istio-egress \
//     -n istio-system
resource "helm_release" "istio_egress" {
  name      = "istio-egress"
  chart     = "../../charts/istio-1.10.1/manifests/charts/gateways/istio-egress"
  namespace = kubernetes_namespace.istio_system.metadata.0.name
}