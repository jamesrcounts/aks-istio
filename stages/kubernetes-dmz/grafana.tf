data "kustomization" "grafana" {
  path = "./grafana"
}

resource "kustomization_resource" "grafana" {
  depends_on = [kubernetes_namespace.istio_system]

  for_each = data.kustomization.grafana.ids
  manifest = data.kustomization.grafana.manifests[each.value]
}