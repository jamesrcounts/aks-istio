// module "istio_operator" {
//   source = "github.com/jamesrcounts/terraform-modules.git//istio-operator?ref=aks"
// }

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

resource "kustomization_resource" "istio_control_plane" {
  depends_on = [module.istio_system_namespace]

  for_each = data.kustomization_build.istio_control_plane.ids
  manifest = data.kustomization_build.istio_control_plane.manifests[each.value]
}