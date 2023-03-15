locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Marcos.Verona"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }

}

variable "rg_name" {
  default = "N01514077-assignment1-RG"

}

variable "location" {
  default = "WestUS"

}

variable "la_workspace" {
  default = "logAnalyticsWorkspace4077"

}

variable "log_sku" {
  default = "PerGB2018"

}

variable "recovery_vault" {
  default = "recoveryVault4077"

}

variable "storage_account" {
  default = "storageaccount4077"

}
