resource "azurerm_postgresql_server" "postgresql_server" {
  name                = var.postgresql_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "B_Gen5_1"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false

  administrator_login          = "psqladmin"
  administrator_login_password = var.postgresql_admin_password
  version                      = "11"

  ssl_enforcement_enabled = true
}

output "postgresql_server_name" {
  value = azurerm_postgresql_server.postgresql_server.name
}
