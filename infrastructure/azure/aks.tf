module "aks" {
  source = "github.com/jamesrcounts/terraform-modules.git//aks?ref=aks"

  environment = "dmz"
  instance_id = data.azurerm_resource_group.main.tags["instance_id"]
}