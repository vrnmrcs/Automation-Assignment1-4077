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

variable "location" {
  type = string
}

variable "disk_count" {
  description = "Number of data disks to create"
  default     = 3
}

variable "disk_size_gb" {
  description = "Size of the data disks in GB"
  default     = 10
}

variable "vm_ids" {
  description = "List of virtual machine IDs to attach the data disks to"
  type        = list(string)
}
