data "kustomization" "grafana" {
  path = "./grafana"
}

resource "kustomization_resource" "grafana" {
  for_each = data.kustomization.grafana.ids
  manifest = data.kustomization.grafana.manifests[each.value]
}