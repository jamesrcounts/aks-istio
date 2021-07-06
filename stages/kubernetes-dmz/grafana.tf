// data "kustomization" "grafana" {
//   path = "./grafana"
// }

// resource "kustomization_resource" "grafana" {
//   depends_on = [module.istio_control_plane]

//   for_each = data.kustomization.grafana.ids
//   manifest = data.kustomization.grafana.manifests[each.value]
// }