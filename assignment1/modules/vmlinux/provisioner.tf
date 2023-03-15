resource "null_resource" "display_hostname" {
  count = var.nb_count

  triggers = {
    vm_id = element(azurerm_linux_virtual_machine.vmlinux.*.id, count.index)
  }

  provisioner "local-exec" {
    command = "echo 'Hostname: ${element(azurerm_linux_virtual_machine.vmlinux.*.name, count.index)}'"
  }
}
