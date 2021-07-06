// data "kustomization" "sleep" {
//   path = "./sleep"
// }

// resource "kustomization_resource" "sleep" {
//   depends_on = [module.app_namespace, module.istio_control_plane]

//   for_each = data.kustomization.sleep.ids
//   manifest = data.kustomization.sleep.manifests[each.value]
// }