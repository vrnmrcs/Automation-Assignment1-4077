resource "azurerm_managed_disk" "data_disk" {
  count                = var.disk_count
  name                 = "datadisk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.disk_count
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id = var.vm_ids[count.index]
  lun                = 10 + count.index
  caching            = "ReadWrite"

}
