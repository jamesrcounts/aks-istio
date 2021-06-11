module "vnet_dmz" {
  source = "github.com/jamesrcounts/terraform-modules.git//virtual-network?ref=aks"

  environment    = "dmz"
  resource_group = data.azurerm_resource_group.main

  subnets = {
    "aks-subnet"                = [8, 240]
    "applicationgateway-subnet" = [8, 2]
  }
}