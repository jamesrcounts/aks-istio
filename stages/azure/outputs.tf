resource "azurerm_key_vault_secret" "config" {
  for_each = {
    dmz-ingress-ip = module.aks_dmz.load_balancer_ip_address
    svc-ingress-ip = module.aks_svc.load_balancer_ip_address
  }

  key_vault_id = data.azurerm_key_vault.config.id
  name         = each.key
  value        = each.value

  tags = {
    stage  = "azure"
    source = "terraform"
  }
}