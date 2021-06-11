data "azurerm_resource_group" "main" {
  name = "rg-becoming-chicken"
}

data "azurerm_resource_group" "backend" {
  name = "rg-backend-${local.backend_instance_id}"
}