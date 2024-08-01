resource "azurerm_service_plan" "app_service_plan_be" {
  name                = "pizza-selector-be-asp-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "pizza_selector_be" {
  name                = "pizza-selector-be-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_service_plan.app_service_plan_be.location
  service_plan_id     = azurerm_service_plan.app_service_plan_be.id

  site_config {
    always_on = false
  }

  app_settings = {
    "NEW_RELIC_APP_NAME"    = "pizza-selector-be-${var.env}"
    "NEW_RELIC_LICENSE_KEY" = var.new_relic_key
  }
}