data "kustomization" "prometheus" {
  path = "./prometheus"
}

resource "kustomization_resource" "prometheus" {
  for_each = data.kustomization.prometheus.ids
  manifest = data.kustomization.prometheus.manifests[each.value]
}