resource "azurerm_user_assigned_identity" "id" {
  name                = "id-noplan-dev-westeurope-001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
}
