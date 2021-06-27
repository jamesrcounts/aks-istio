module "istio_operator" {
  source = "github.com/jamesrcounts/terraform-modules.git//istio-operator?ref=aks"
}

resource "helm_release" "istio_control_plane" {
  atomic     = true
  chart      = "control-plane"
  lint       = true
  name       = "istio-control-plane"
  repository = "${path.module}/istio"

  set {
    name  = "ingressGateway.ip.resourceGroup"
    value = data.azurerm_resource_group.main.name
  }

  set {
    name  = "ingressGateway.ip.value"
    value = nonsensitive(data.azurerm_key_vault_secret.config["dmz-ingress-ip"].value)
  }
}