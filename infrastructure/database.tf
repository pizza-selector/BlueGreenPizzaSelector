resource "random_password" "password" {
  length      = 16
  special     = true
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1

  override_special = "!#$%"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "pizza-sqlserver-${var.env}"
  resource_group_name          = azurerm_resource_group.pizza_selector_rg.name
  location                     = azurerm_resource_group.pizza_selector_rg.location
  version                      = "12.0"
  administrator_login          = "terraformoperator"
  administrator_login_password = random_password.password.result
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "Pizza Selector"
    object_id      = "b05c30c9-c432-4c8d-ae49-1f4528f6ccdc"
  }
}

resource "azurerm_mssql_database" "db" {
  name         = "pizza-db-${var.env}"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "Basic"
}



resource "null_resource" "create-sql-user" {

  provisioner "local-exec" {
    command = <<EOT
    Install-Module -Name SqlServer -Force
     Invoke-Sqlcmd -Username terraformoperator -Password ${random_password.password.result} -Query "CREATE USER [${azurerm_linux_web_app.pizza_selector_be.name}] FROM EXTERNAL PROVIDER; ALTER ROLE db_datareader ADD MEMBER [${azurerm_linux_web_app.pizza_selector_be.name}]; ALTER ROLE db_datawriter ADD MEMBER [${azurerm_linux_web_app.pizza_selector_be.name}]; ALTER ROLE db_ddladmin ADD MEMBER [${azurerm_linux_web_app.pizza_selector_be.name}];" -ConnectionString "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name}.database.windows.net,1433;Initial Catalog=Master;Persist Security Info=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;" 
    EOT

    interpreter = ["pwsh", "-Command"]
  }

  depends_on = [azurerm_mssql_database.db]
}