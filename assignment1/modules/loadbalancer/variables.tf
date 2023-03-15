variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {
  default = "loadbalancer4077"
}

variable "lb_public_ip_name" {
  default = "lbpip4077"
}

variable "backend_address_pool_name" {
  default = "backend_pool4077"
}

variable "probe_name" {
  default = "probe4077"
}

variable "probe_port" {
  default = "22"
}

variable "lb_rule_name" {
  default = "lb_rule4077"
}

variable "lb_frontend_port" {
  default = "22"
}

variable "lb_backend_port" {
  default = "22"
}




 