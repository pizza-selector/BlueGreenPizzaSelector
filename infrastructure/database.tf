
resource "azurerm_mssql_server" "sql_server" {
  name                = "pizza-sqlserver-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  version             = "12.0"
  minimum_tls_version = "1.2"

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = "Pizza Selector"
    object_id                   = "dd8e1ef7-e75d-4373-868a-1f331442ba81"
  }
}

resource "azurerm_mssql_firewall_rule" "azure_firewall_exception" {
  name             = "AllowAccessFromAzure"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"

  depends_on = [azurerm_mssql_database.db]
}

resource "azurerm_mssql_database" "db" {
  name         = "pizza-db-${var.env}"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "Basic"
}
