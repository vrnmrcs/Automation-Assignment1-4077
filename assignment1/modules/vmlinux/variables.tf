locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Marcos.Verona"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }

}

variable "linux_avs" {
  default = "linux_avset4077"
}

variable "rg_name" {
  default = "N01514077-assignment1-RG"
}

variable "location" {
  default = "WestUS"

}

variable "nb_count" {
  default = "2"
}

variable "linux_name" {
  default = "N01514077-u-vm1"
}

variable "subnet_id" {
  description = "default subnet id"
}

variable "storage_account_blob_endpoint" {
  type        = string
  description = "The primary blob endpoint of the storage account for boot diagnostics."
}


variable "size" {
  default = "Standard_B1ms"
}

variable "admin_username" {
  default = "N01514077"
}

variable "admin_password" {
  default = "Lawrence2017."
}

variable "public_key" {
  default = "C:/Users/vrnmr/.ssh/id_rsa.pub"
}

variable "publisher" {
  default = "OpenLogic"
}

variable "offer" {
  default = "CentOS"
}

variable "sku" {
  default = "8_2"
}

variable "os_version" {
  default = "latest"
}

variable "los_disk_attr" {
  type = map(string)
  default = {
    storage_account_type = "Standard_LRS"
    disk_size            = "32"
    caching              = "ReadWrite"
  }
}

variable "private_key" {
  default = "C:/Users/vrnmr/.ssh/id_rsa"

}

variable "backend_address_pool_id" {
  description = "The ID of the load balancer backend address pool to associate with the VMs"
  type        = string
}













