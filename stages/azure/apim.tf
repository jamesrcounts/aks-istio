// module "apim" {
//   source = "github.com/jamesrcounts/terraform-modules.git//apim?ref=aks"

//   log_analytics_workspace = data.azurerm_log_analytics_workspace.logs
//   resource_group          = data.azurerm_resource_group.main
//   subnet                  = { id = module.vnet_dmz.subnets["apim-subnet"] }

//   domains = {
//     portal = {
//       host_name = "portal.jamesrcounts.com"
//       secret_id = data.azurerm_key_vault_certificate.certificate["portal"].secret_id
//     }
//     gateway = {
//       host_name = "api.jamesrcounts.com"
//       secret_id = data.azurerm_key_vault_certificate.certificate["gateway"].secret_id
//     }
//   }
// }