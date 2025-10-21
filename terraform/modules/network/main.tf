########################################
# modules/network/main.tf
########################################

resource "libvirt_network" "net" {
  name      = var.name
  mode      = var.mode
  domain    = var.domain
  addresses = var.addresses
  bridge    = var.bridge
  autostart = var.autostart

  dns {
    enabled = var.dns
  }

  dhcp {
    enabled = var.dhcp
  }
}