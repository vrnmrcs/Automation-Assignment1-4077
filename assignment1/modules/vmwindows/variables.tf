locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Marcos.Verona"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }

}

variable "rg_name" {
  type = string
}

variable "windows_name" {
  default = "N01514077-w-vm1"
}

variable "windows_avs" {
  default = "windows_avset4077"
}
variable "location" {
  type = string
}
variable "size" {
  default = "Standard_B1ms"
}
variable "windows_admin_username" {
  default = "N01514077"
}

variable "windows_admin_password" {
  default = "Lawrence2017@"
}

variable "subnet_id" {
  type = string
}
variable "storage_account_blob_endpoint" {
  type = string
}
