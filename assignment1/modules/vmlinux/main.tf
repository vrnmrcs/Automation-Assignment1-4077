resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.common_tags
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-${format("%1d", count.index + 1)}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = lower("${var.linux_name}-${format("%1d", count.index + 1)}")
  tags                = local.common_tags
}


resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-${format("%1d", count.index + 1)}-nic"
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {

    name                          = "${var.linux_name}-${format("%1d", count.index + 1)}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)



  }
  tags = local.common_tags

}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  count                 = var.nb_count
  name                  = "${var.linux_name}-${format("%1d", count.index + 1)}"
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  computer_name         = "${var.linux_name}-${format("%1d", count.index + 1)}"
  availability_set_id   = azurerm_availability_set.linux_avs.id


  boot_diagnostics {
    storage_account_uri = var.storage_account_blob_endpoint
  }



  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }

  os_disk {
    name                 = "${var.linux_name}-${format("%1d", count.index + 1)}-os-disk"
    storage_account_type = var.los_disk_attr["storage_account_type"]
    disk_size_gb         = var.los_disk_attr["disk_size"]
    caching              = var.los_disk_attr["caching"]
  }
  tags = local.common_tags
}

resource "azurerm_network_interface_backend_address_pool_association" "backend_asso" {
  count                   = 2
  network_interface_id    = azurerm_network_interface.linux_nic[count.index].id
  ip_configuration_name   = "${var.linux_name}-${format("%1d", count.index + 1)}-ipconfig"
  backend_address_pool_id = var.backend_address_pool_id
}



resource "azurerm_virtual_machine_extension" "network_watcher" {
  count                      = var.nb_count
  name                       = "${azurerm_linux_virtual_machine.vmlinux[count.index].name}-nw"
  virtual_machine_id         = azurerm_linux_virtual_machine.vmlinux[count.index].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
{
  "scriptName": "networkwatcher_v2.sh"
}
SETTINGS
  tags     = local.common_tags
}

