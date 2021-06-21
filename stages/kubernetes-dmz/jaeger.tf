data "kustomization" "jaeger" {
  path = "./jaeger"
}

resource "kustomization_resource" "jaeger" {
  depends_on = [module.istio]

  for_each = data.kustomization.jaeger.ids
  manifest = data.kustomization.jaeger.manifests[each.value]
}