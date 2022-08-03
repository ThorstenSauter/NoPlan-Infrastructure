resource "azurerm_container_registry" "acr" {
  name                = "crnoplandev001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_role_assignment" "uami-acrpull-role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
}

resource "azurerm_role_assignment" "github-actions-acrpush-role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPush"
  principal_id         = var.github-actions-principal-id
}

variable "github-actions-principal-id" {
  default     = "49e7a027-01d8-4712-aca6-6ecc3c462c61"
  description = "The object id of the service principal running GitHub Actions."
}
