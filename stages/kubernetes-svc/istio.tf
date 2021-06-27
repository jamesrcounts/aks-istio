module "istio_operator" {
  source = "github.com/jamesrcounts/terraform-modules.git//istio-operator?ref=aks"
}

module "istio_control_plane" {
  source     = "github.com/jamesrcounts/terraform-modules.git//istio-control-plane?ref=aks"
  depends_on = [module.istio_operator]

  ingress_gateway = {
    ip = {
      resource_group = data.azurerm_resource_group.main.name
      value          = nonsensitive(data.azurerm_key_vault_secret.config["svc-ingress-ip"].value)
    }
  }
}