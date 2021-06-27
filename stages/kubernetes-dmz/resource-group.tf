locals {
  backend_instance_id = data.azurerm_resource_group.main.tags["backend_instance_id"]
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "backend" {
  name = "rg-backend-${local.backend_instance_id}"
}