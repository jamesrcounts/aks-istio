variable "aks_cluster_name" {
  description = "(Required) The name of the AKS cluster to configure."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group for this project."
  type        = string
}
