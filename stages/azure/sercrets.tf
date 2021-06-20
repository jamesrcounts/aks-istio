data "azurerm_key_vault" "config" {
  name                = "kv-${local.backend_instance_id}"
  resource_group_name = data.azurerm_resource_group.backend.name
}

data "azurerm_key_vault_certificate" "certificate" {
  for_each = {
    portal  = "portal-jamesrcounts-com"
    gateway = "api-jamesrcounts-com"
  }

  name         = each.value
  key_vault_id = data.azurerm_key_vault.config.id
}