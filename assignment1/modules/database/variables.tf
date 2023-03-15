locals {
  common_tags = {
    Project        = "Automation Project-Assignment 1"
    Name           = "Marcos.Verona"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }

}

variable "postgresql_name" {
  type        = string
  description = "The name of the PostgreSQL server instance."
}

variable "location" {
  type        = string
  description = "The location where the PostgreSQL server instance should be created."
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group where the PostgreSQL server instance should be created."
}

variable "postgresql_admin_password" {
  type        = string
  description = "The password for the PostgreSQL server instance administrator."
}
