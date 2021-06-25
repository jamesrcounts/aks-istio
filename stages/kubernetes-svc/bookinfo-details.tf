data "kustomization_build" "bookinfo_details" {
  path = "${path.module}/bookinfo-details"
}

resource "kustomization_resource" "bookinfo_details" {
  for_each = data.kustomization_build.bookinfo_details.ids
  manifest = data.kustomization_build.bookinfo_details.manifests[each.value]
}