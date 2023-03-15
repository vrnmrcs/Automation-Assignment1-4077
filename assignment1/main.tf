module "rgroup" {
  source = "./modules/rgroup"

  rg_name  = "N01514077-assignment1-RG"
  location = "WestUS"
}

module "network" {
  source = "./modules/network"

  rg_name        = module.rgroup.rg_name
  location       = "WestUS"
  vnet           = "myVirtualNetwork4077"
  vnet_space     = ["10.0.0.0/16"]
  subnet1        = "net-subnet4077"
  subnet_space_1 = ["10.0.1.0/24"]

}

module "common" {
  source = "./modules/common"

  rg_name         = module.rgroup.rg_name
  location        = "WestUS"
  la_workspace    = "logAnalyticsWorkspace4077"
  log_sku         = "PerGB2018"
  recovery_vault  = "recoveryVault4077"
  storage_account = "storageaccount4077"
}

module "vmlinux" {
  source = "./modules/vmlinux"

  rg_name                       = module.rgroup.rg_name
  location                      = "WestUS"
  linux_avs                     = "linux_avset4077"
  nb_count                      = "2"
  linux_name                    = "N01514077-u-vm1"
  size                          = "Standard_B1ms"
  admin_username                = "N01514077"
  admin_password                = "Lawrence2017."
  public_key                    = "C:/Users/vrnmr/.ssh/id_rsa.pub"
  publisher                     = "OpenLogic"
  offer                         = "CentOS"
  sku                           = "8_2"
  os_version                    = "latest"
  subnet_id                     = module.network.subnet_id
  storage_account_blob_endpoint = module.common.storage_account_blob_endpoint
  backend_address_pool_id       = module.loadbalancer.backend_address_pool_id
}

module "vmwindows" {
  source = "./modules/vmwindows"

  rg_name                       = module.rgroup.rg_name
  location                      = "WestUS"
  windows_name                  = "N01514077-w-vm1"
  windows_avs                   = "windows_avset4077"
  size                          = "Standard_B1ms"
  windows_admin_username        = "N01514077"
  windows_admin_password        = "Lawrence2017."
  subnet_id                     = module.network.subnet_id
  storage_account_blob_endpoint = module.common.storage_account_blob_endpoint
}

module "datadisk" {
  source = "./modules/datadisk"

  rg_name      = module.rgroup.rg_name
  location     = "WestUS"
  disk_count   = "3"
  disk_size_gb = "10"
  vm_ids       = concat(flatten(module.vmlinux.linux_vm_ids), [module.vmwindows.windows_vm_id])

}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  rg_name                   = module.rgroup.rg_name
  location                  = "WestUS"
  lb_name                   = "loadbalancer4077"
  lb_public_ip_name         = "lbpip4077"
  backend_address_pool_name = "backend_pool4077"
  probe_name                = "probe4077"
  probe_port                = "22"
  lb_rule_name              = "lb_rule4077"
  lb_frontend_port          = "22"
  lb_backend_port           = "22"
  
}
module "database" {
  source = "./modules/database"

  rg_name                   = module.rgroup.rg_name
  postgresql_name           = "postgresql4077"
  location                  = "WestUS"
  postgresql_admin_password = "Lawrence2017."
}


