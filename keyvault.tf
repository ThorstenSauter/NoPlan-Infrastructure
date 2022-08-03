resource "azurerm_key_vault" "vault" {
  name                        = "kv-noplan-dev-001"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = false
  enable_rbac_authorization   = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = false
  sku_name                    = "standard"
  tags                        = var.tags
}

resource "azurerm_role_assignment" "uami-secrets-user-role" {
  scope                = azurerm_key_vault.vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
}

resource "azurerm_role_assignment" "dev-group-secrets-administrator-role" {
  scope                = azurerm_key_vault.vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.developer-group.id
}

variable "developer-group" {
  type = map(string)
  default = {
    id   = "914fff5e-bedf-443b-82ad-c4ceccb192c3"
    name = "NoPlan Developers"
  }
  description = "The AAD group containing the app developers."
}
