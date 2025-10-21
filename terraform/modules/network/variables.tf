variable "name" {
  type = string
}

variable "mode" {
  type = string
}

variable "domain" {
  type    = string
  default = null
}

variable "addresses" {
  type    = list(string)
  default = []
}

variable "bridge" {
  type    = string
  default = null
}

variable "dhcp" {
  type    = bool
  default = false
}

variable "dns" {
  type    = bool
  default = false
}

variable "autostart" {
  type    = bool
  default = false
}
