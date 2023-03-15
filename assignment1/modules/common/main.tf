resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_workspace
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_sku
  retention_in_days   = "30"
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_vault
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  tags                = local.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}



