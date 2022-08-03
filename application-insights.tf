resource "azurerm_application_insights" "appinsights" {
  name                = "appi-noplan-dev-001"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.appinsights-workspace.id
  application_type    = "web"
  sampling_percentage = 0
  tags                = var.tags
}

resource "azurerm_log_analytics_workspace" "appinsights-workspace" {
  name                = "log-noplan-dev-001"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}
