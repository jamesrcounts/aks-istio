data "kustomization" "istio" {
  path = "./istio"
}

resource "kustomization_resource" "istio" {
  for_each   = data.kustomization.istio.ids
  manifest   = data.kustomization.istio.manifests[each.value]
  depends_on = [kustomization_resource.istio_operator]
}