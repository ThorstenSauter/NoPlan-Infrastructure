resource "azurerm_mssql_server" "sql-server" {
  name                = "sql-noplan-dev-001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  version             = "12.0"
  minimum_tls_version = "1.2"
  tags                = var.tags

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = var.developer-group.name
    object_id                   = var.developer-group.id
    tenant_id                   = data.azurerm_client_config.current.tenant_id
  }
}

resource "azurerm_mssql_database" "noplan" {
  name                 = "noplan"
  server_id            = azurerm_mssql_server.sql-server.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb          = 2
  sku_name             = "Basic"
  storage_account_type = "Local"
  tags                 = var.tags
}
