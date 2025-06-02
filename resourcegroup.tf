resource "azurerm_resource_group" "resource-grp" {
  name     = var.config-rg.resource-group-name
  location = var.config-rg.location
  tags     = var.tags
}
