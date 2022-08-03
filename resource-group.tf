resource "azurerm_resource_group" "rg" {
  name     = "rg-noplan-dev-001"
  location = var.location
  tags     = var.tags
}
