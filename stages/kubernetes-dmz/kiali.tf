data "kustomization" "kiali" {
  path = "./kiali"
}

resource "kustomization_resource" "kiali" {
  depends_on = [module.istio]

  for_each = data.kustomization.kiali.ids
  manifest = data.kustomization.kiali.manifests[each.value]
}