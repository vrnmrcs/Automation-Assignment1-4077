resource "azurerm_public_ip" "lb_pip" {
  name                = var.lb_public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_lb" "assignment1lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  name            = var.backend_address_pool_name
  loadbalancer_id = azurerm_lb.assignment1lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.assignment1lb.id
  protocol            = "Tcp"
  port                = var.probe_port
  interval_in_seconds = 15
  number_of_probes    = 4
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.assignment1lb.id
  protocol                       = "Tcp"
  frontend_port                  = var.lb_frontend_port
  backend_port                   = var.lb_backend_port
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.lb_probe.id
}



