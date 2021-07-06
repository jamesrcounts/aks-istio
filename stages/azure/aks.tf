// module "aks_dmz" {
//   source = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"

//   environment             = "dmz"
//   resource_group          = data.azurerm_resource_group.main
//   subnet                  = { id = module.vnet_dmz.subnets["aks-dmz-subnet"] }
//   log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
// }

// module "aks_svc" {
//   source = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"

//   environment             = "svc"
//   resource_group          = data.azurerm_resource_group.main
//   subnet                  = { id = module.vnet_dmz.subnets["aks-svc-subnet"] }
//   log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
// }

module "aks" {
  source   = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"
  for_each = local.clusters

  environment             = each.key
  resource_group          = data.azurerm_resource_group.main
  subnet                  = { id = module.vnet_dmz.subnets["aks-${each.key}-subnet"] }
  log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
}