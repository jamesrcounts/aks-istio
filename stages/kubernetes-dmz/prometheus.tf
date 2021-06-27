data "kustomization" "prometheus" {
  path = "./prometheus"
}

resource "kustomization_resource" "prometheus" {
  depends_on = [helm_release.istio_control_plane]

  for_each = data.kustomization.prometheus.ids
  manifest = data.kustomization.prometheus.manifests[each.value]
}