output "rg_name" {
  value = module.rgroup.rg_name

}

output "vnet" {
  value = module.network.vnet

}

output "subnet1" {
  value = module.network.subnet1

}

output "la_workspace" {
  value = module.common.la_workspace
}

output "recovery_vault" {
  value = module.common.recovery_vault

}

output "storage_account" {
  value = module.common.storage_account
}

output "linux_public_ip_addresses" {
  value = module.vmlinux.linux_public_ip_addresses
}

output "Linux_private_ip_addresses" {
  value = module.vmlinux.linux_vm_private_ips

}

output "linux_vm_hostname" {
  value = module.vmlinux.vm_hostname

}

output "vm_domain_names" {
  value = module.vmlinux.vm_domain_names

}

output "windows_vm_hostname" {
  value = module.vmwindows.windows_vm_hostname

}

output "windows_vm_domain_name" {
  value = module.vmwindows.windows_vm_domain_name

}

output "windows_vm_private_ip" {
  value = module.vmwindows.windows_vm_private_ip

}

output "windows_public_ip" {
  value = module.vmwindows.windows_public_ip

}

output "lb_name" {
  value = module.loadbalancer.lb_name

}


output "postgresql_name" {
  value = module.database.postgresql_name

}
