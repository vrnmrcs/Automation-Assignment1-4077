resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.common_tags
}

resource "azurerm_public_ip" "windows_pip" {
  name                = "${var.windows_name}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = lower("${var.windows_name}")
  tags                = local.common_tags
}



resource "azurerm_network_interface" "windows_nic" {
  name                = "${var.windows_name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.windows_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip.id
  }

  tags = local.common_tags
}

resource "azurerm_windows_virtual_machine" "vmwindowsss" {
  name                  = var.windows_name
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = var.size
  admin_username        = var.windows_admin_username
  admin_password        = var.windows_admin_password
  network_interface_ids = [azurerm_network_interface.windows_nic.id]

  boot_diagnostics {
    storage_account_uri = var.storage_account_blob_endpoint
  }

  os_disk {
    name                 = "${var.windows_name}-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.vmwindowsss.id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
  {
    "AntimalwareEnabled": true
  }
SETTINGS

  tags = local.common_tags
}

