data "kustomization" "bookinfo" {
  path = "./bookinfo"
}

resource "kustomization_resource" "bookinfo" {
  for_each = data.kustomization.bookinfo.ids
  manifest = data.kustomization.bookinfo.manifests[each.value]
}