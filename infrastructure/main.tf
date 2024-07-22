terraform {
  required_version = "1.8.2"
  backend "azurerm" {
    resource_group_name  = "<BACKEND-ENV>"
    storage_account_name = "<BACKEND-ENV>"
    container_name       = "<BACKEND-ENV>"
    key                  = "<BACKEND-ENV>"
  }

  required_providers {
    azurerm = {
      version = "=3.101.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pizza_selector_rg" {
  name     = "pizza-selector-${var.env}"
  location = "West Europe"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "pizza-selector-ui-asp-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_resource_group.pizza_selector_rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "pizza_selector_ui" {
  name                = "pizza-selector-ui-${var.env}"
  resource_group_name = azurerm_resource_group.pizza_selector_rg.name
  location            = azurerm_service_plan.app_service_plan.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on                 = false
  }
}