resource "azurerm_app_configuration" "app-config" {
  name                = "appcs-noplan-dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "free"
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.id.id]
  }
  tags = var.tags
}
