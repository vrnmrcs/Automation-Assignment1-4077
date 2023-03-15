resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  address_prefixes     = var.subnet_space_1
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}
