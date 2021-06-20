data "azurerm_log_analytics_workspace" "logs" {
  name                = "la-${local.backend_instance_id}"
  resource_group_name = data.azurerm_resource_group.backend.name
}

resource "azurerm_log_analytics_solution" "insights" {
  solution_name         = "ContainerInsights"
  location              = var.log_analytics_workspace.location
  resource_group_name   = var.log_analytics_workspace.resource_group_name
  workspace_resource_id = var.log_analytics_workspace.id
  workspace_name        = var.log_analytics_workspace.name
  tags                  = var.resource_group.tags

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}