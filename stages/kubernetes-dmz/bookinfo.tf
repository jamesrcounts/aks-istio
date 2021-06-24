data "kustomization" "bookinfo" {
  path = "./bookinfo"
}

resource "kustomization_resource" "bookinfo" {
  depends_on = [module.app_namespace, module.istio]

  for_each = data.kustomization.bookinfo.ids
  manifest = data.kustomization.bookinfo.manifests[each.value]
}