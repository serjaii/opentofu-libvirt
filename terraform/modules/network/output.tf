########################################
# modules/network/outputs.tf
########################################

output "id" {
  value = libvirt_network.net.id
}

output "name" {
  value = libvirt_network.net.name
}
