// module "istio_control_plane" {
//   source     = "github.com/jamesrcounts/terraform-modules.git//istio-control-plane?ref=aks"
//   depends_on = [module.istio_operator]

//   ingress_gateway = {
//     ip = {
//       resource_group = data.azurerm_resource_group.main.name
//       value          = nonsensitive(data.azurerm_key_vault_secret.config["dmz-ingress-ip"].value)
//     }
//   }
// }

data "kustomization_build" "istio_control_plane" {
  path = "./istio-control-plane"
}

resource "kustomization_resource" "istio_control_plane_p0" {
  for_each = data.kustomization_build.istio_control_plane.ids_prio[0]

  manifest = data.kustomization_build.istio_control_plane.manifests[each.value]
}

# then loop through resources in ids_prio[1]
# and set an explicit depends_on on kustomization_resource.p0
resource "kustomization_resource" "istio_control_plane_p1" {
  depends_on = [kustomization_resource.istio_control_plane_p0]
  for_each   = data.kustomization_build.istio_control_plane.ids_prio[1]

  manifest = data.kustomization_build.istio_control_plane.manifests[each.value]
}

# finally, loop through resources in ids_prio[2]
# and set an explicit depends_on on kustomization_resource.p1
resource "kustomization_resource" "istio_control_plane_p2" {
  depends_on = [kustomization_resource.istio_control_plane_p1]
  for_each   = data.kustomization_build.istio_control_plane.ids_prio[2]

  manifest = data.kustomization_build.istio_control_plane.manifests[each.value]
}