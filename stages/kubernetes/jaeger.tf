data "kustomization" "jaeger" {
  path = "./jaeger"
}

resource "kustomization_resource" "jaeger" {
  for_each = data.kustomization.jaeger.ids
  manifest = data.kustomization.jaeger.manifests[each.value]
}