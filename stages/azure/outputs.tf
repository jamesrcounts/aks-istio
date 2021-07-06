resource "azurerm_key_vault_secret" "load_balancer_ips" {
  for_each = local.clusters

  key_vault_id = data.azurerm_key_vault.config.id
  name         = replace(each.value, ".", "-")
  value        = module.aks[each.key].load_balancer_ip_address

  tags = {
    stage  = "azure"
    source = "terraform"
  }
}