resource "azurerm_resource_group" "rg" {
  name     = "rg-noplan-dev-002"
  location = var.location
  tags     = var.tags
}
