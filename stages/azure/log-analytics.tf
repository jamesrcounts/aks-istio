data "azurerm_log_analytics_workspace" "logs" {
  name                = "la-${local.backend_instance_id}"
  resource_group_name = data.azurerm_resource_group.backend.name
}