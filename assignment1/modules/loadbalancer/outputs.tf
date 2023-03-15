output "lb_name" {
  value = azurerm_lb.assignment1lb.name
}

output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.lb_backend.id
}
