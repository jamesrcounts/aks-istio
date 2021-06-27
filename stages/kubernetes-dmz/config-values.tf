data "azurerm_key_vault" "config" {
  name                = "kv-${local.backend_instance_id}"
  resource_group_name = data.azurerm_resource_group.backend.name
}

data "azurerm_key_vault_secret" "config" {
  for_each = toset(["dmz-ingress-ip", "svc-ingress-ip"])

  name         = each.value
  key_vault_id = data.azurerm_key_vault.config.id
}