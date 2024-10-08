moved {
  from = azurerm_service_plan.app_service_plan
  to   = azurerm_service_plan.app_service_plan_fe
}

resource "azurerm_service_plan" "app_service_plan_fe" {
  name                = "pizza-selector-ui-asp-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "pizza_selector_ui" {
  name                = "pizza-selector-ui-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_service_plan.app_service_plan_fe.location
  service_plan_id     = azurerm_service_plan.app_service_plan_fe.id

  site_config {
    always_on = false
  }
}