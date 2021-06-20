module "aks_dmz" {
  source = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"

  environment             = "dmz"
  resource_group          = data.azurerm_resource_group.main
  subnet                  = { id = module.vnet_dmz.subnets["aks-subnet"] } #TODO: use aks-dmz-subnet
  log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
}

module "aks_svc" {
  source = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"

  environment             = "svc"
  resource_group          = data.azurerm_resource_group.main
  subnet                  = { id = module.vnet_dmz.subnets["aks-svc-subnet"] }
  log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
}