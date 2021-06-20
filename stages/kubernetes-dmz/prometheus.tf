data "kustomization" "prometheus" {
  path = "./prometheus"
}

resource "kustomization_resource" "prometheus" {
  depends_on = [kubernetes_namespace.istio_system]

  for_each = data.kustomization.prometheus.ids
  manifest = data.kustomization.prometheus.manifests[each.value]
}