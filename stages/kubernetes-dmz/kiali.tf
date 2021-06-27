data "kustomization" "kiali" {
  path = "./kiali"
}

resource "kustomization_resource" "kiali" {
  depends_on = [module.istio_control_plane]

  for_each = data.kustomization.kiali.ids
  manifest = data.kustomization.kiali.manifests[each.value]
}