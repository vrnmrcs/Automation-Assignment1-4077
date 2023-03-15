output "vm_hostname" {
  value       = [azurerm_linux_virtual_machine.vmlinux[*].name]
  description = "The hostnames of the virtual machines."
}

output "linux_vm_private_ips" {
  value       = [azurerm_network_interface.linux_nic[*].ip_configuration[0].private_ip_address]
  description = "The private IP addresses of the virtual machines."
}

output "linux_public_ip_addresses" {
  value       = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
  description = "The public IP addresses of the virtual machines."
}

output "vm_domain_names" {
  value       = [azurerm_public_ip.linux_pip[*].domain_name_label]
  description = "The unique DNS labels assigned to the virtual machines."
}

output "linux_vm_ids" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].id]

}

output "linux_vm_nic_ids" {
  value = [azurerm_network_interface.linux_nic[*].id]
}