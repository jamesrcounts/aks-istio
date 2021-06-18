data "kustomization" "jaeger" {
  path = "./jaeger"
}

resource "kustomization_resource" "jaeger" {
  depends_on = [kubernetes_namespace.istio_system]

  for_each = data.kustomization.jaeger.ids
  manifest = data.kustomization.jaeger.manifests[each.value]
}