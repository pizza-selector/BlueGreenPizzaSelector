resource "azurerm_service_plan" "app_service_plan_be" {
  name                = "pizza-selector-be-asp-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  os_type             = "Linux"
  sku_name            = "P0v3"
}

resource "azurerm_linux_web_app" "pizza_selector_be" {
  name                = "pizza-selector-be-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_service_plan.app_service_plan_be.location
  service_plan_id     = azurerm_service_plan.app_service_plan_be.id

  site_config {
    always_on = false
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "NEW_RELIC_APP_NAME"    = "pizza-selector-be-${var.env}"
    "NEW_RELIC_LICENSE_KEY" = var.new_relic_key
    "SQL_CONNECTION_STRING" = "jdbc:sqlserver://${azurerm_mssql_server.sql_server.fully_qualified_domain_name}:1433;databaseName=pizza-db-${var.env};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;Authentication=ActiveDirectoryMSI;"
  }
}

resource "azurerm_linux_web_app_slot" "pizza_selector_be_slot" {
  name           = "staging-slot"
  app_service_id = azurerm_linux_web_app.pizza_selector_be.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = false
  }

  app_settings = {
    "NEW_RELIC_APP_NAME"    = "pizza-selector-be-${var.env}"
    "NEW_RELIC_LICENSE_KEY" = var.new_relic_key
    "SQL_CONNECTION_STRING" = "jdbc:sqlserver://${azurerm_mssql_server.sql_server.fully_qualified_domain_name}:1433;databaseName=pizza-db-${var.env};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;Authentication=ActiveDirectoryMSI;"
  }
}