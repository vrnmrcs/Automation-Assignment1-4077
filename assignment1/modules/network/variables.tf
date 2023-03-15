variable "rg_name" {
  default = "N01514077-assignment1-RG"

}

variable "location" {
  default = "WestUS"

}


variable "vnet" {
  default = "myVirtualNetwork4077"

}

variable "vnet_space" {
  default = ["10.0.0.0/16"]

}

variable "subnet1" {
  default = "net-subnet4077"

}

variable "subnet_space_1" {
  default = ["10.0.1.0/24"]

}
