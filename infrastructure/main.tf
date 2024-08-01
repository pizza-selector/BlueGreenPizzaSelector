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
    mssql = {
      version = "=0.6.0"
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
