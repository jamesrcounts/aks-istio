data "kustomization" "sleep" {
  path = "./sleep"
}

resource "kustomization_resource" "sleep" {
  depends_on = [kubernetes_namespace.apps, module.istio]

  for_each = data.kustomization.sleep.ids
  manifest = data.kustomization.sleep.manifests[each.value]
}