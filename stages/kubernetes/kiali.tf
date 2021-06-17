data "kustomization" "kiali" {
  path = "./kiali"
}

resource "kustomization_resource" "kiali" {
  for_each = data.kustomization.kiali.ids
  manifest = data.kustomization.kiali.manifests[each.value]
}