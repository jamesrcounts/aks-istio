data "kustomization" "kiali" {
  path = "./kiali"
}

resource "kustomization_resource" "kiali" {
  depends_on = [kubernetes_namespace.istio_system]

  for_each = data.kustomization.kiali.ids
  manifest = data.kustomization.kiali.manifests[each.value]
}