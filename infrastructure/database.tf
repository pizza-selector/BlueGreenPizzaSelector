resource "azurerm_mssql_server" "sql_server" {
  name                = "pizza-sqlserver-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  version             = "12.0"

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = "Pizza Selector"
    object_id                   = "b05c30c9-c432-4c8d-ae49-1f4528f6ccdc"
  }
}

resource "azurerm_mssql_database" "db" {
  name         = "pizza-db-${var.env}"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "Basic"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}