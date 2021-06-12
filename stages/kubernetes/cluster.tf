data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
}

// data "azurerm_subnet" "aks" {
//   name                 = "aks-subnet"
//   virtual_network_name = var.aks_vnet_name
//   resource_group_name  = var.resource_group_name
// }