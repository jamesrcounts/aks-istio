data "kustomization" "grafana" {
  path = "./grafana"
}

resource "kustomization_resource" "grafana" {
  depends_on = [helm_release.istio_control_plane]

  for_each = data.kustomization.grafana.ids
  manifest = data.kustomization.grafana.manifests[each.value]
}