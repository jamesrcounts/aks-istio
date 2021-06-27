data "kustomization_build" "bookinfo_details" {
  path = "${path.module}/bookinfo-details"
}

resource "kustomization_resource" "bookinfo_details" {
  depends_on = [module.istio_control_plane]
  for_each   = data.kustomization_build.bookinfo_details.ids

  manifest = data.kustomization_build.bookinfo_details.manifests[each.value]
}