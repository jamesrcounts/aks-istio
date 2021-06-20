module "vnet_dmz" {
  source = "github.com/jamesrcounts/terraform-modules.git//virtual-network?ref=aks"

  environment             = "dmz"
  resource_group          = data.azurerm_resource_group.main
  log_analytics_workspace = data.azurerm_log_analytics_workspace.logs

  subnets = {
    "aks-subnet"                = [8, 240]
    "applicationgateway-subnet" = [8, 2]
    "apim-subnet"               = [8, 4]
  }
}