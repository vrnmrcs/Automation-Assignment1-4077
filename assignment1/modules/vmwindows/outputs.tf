output "windows_vm_hostname" {
  value = azurerm_windows_virtual_machine.vmwindowsss.name
}

output "windows_vm_domain_name" {
  value = azurerm_public_ip.windows_pip.domain_name_label
}

output "windows_vm_private_ip" {
  value = azurerm_network_interface.windows_nic.ip_configuration[0].private_ip_address
}

output "windows_public_ip" {
  value = azurerm_windows_virtual_machine.vmwindowsss.public_ip_address
}

output "windows_vm_id" {
  value = azurerm_windows_virtual_machine.vmwindowsss.id
}
