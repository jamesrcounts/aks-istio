data "kustomization" "jaeger" {
  path = "./jaeger"
}

resource "kustomization_resource" "jaeger" {
  depends_on = [helm_release.istio_control_plane]

  for_each = data.kustomization.jaeger.ids
  manifest = data.kustomization.jaeger.manifests[each.value]
}