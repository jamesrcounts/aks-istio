data "kustomization" "bookinfo" {
  path = "./bookinfo"
}

resource "kustomization_resource" "bookinfo" {
  depends_on = [module.app_namespace, helm_release.istio_control_plane]

  for_each = data.kustomization.bookinfo.ids
  manifest = data.kustomization.bookinfo.manifests[each.value]
}