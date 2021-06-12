variable "aks_cluster_name" {
  description = "(Required) The name of the AKS cluster to configure."
  type        = string
}

variable "aks_vnet_name" {
  description = "(Required) The name for the vnet containing the subnet configured for AKS nodes."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group for this project."
  type        = string
}

// variable "backend_resource_group_name" {
//   description = "(Required) The name of the resource group containing backend resources for this project."
//   type        = string
// }

// variable "configuration_keyvault_name" {
//   description = "(Required) The name of the key vault containing configuration data."
//   type        = string
// }