##############################################
# network.tf — Definición de redes libvirt
##############################################

##############################################
# Red NAT con DHCP 
##############################################

resource "libvirt_network" "nat-dhcp" {
  name      = "nat-dhcp"
  mode      = "nat"
  domain    = "example.com"
  addresses = ["192.168.150.0/24"]
  bridge    = "virbr10"
  dhcp { enabled = true }
  dns { enabled = true }
  autostart = true
}

##############################################
# Red NAT sin DHCP
##############################################

#resource "libvirt_network" "nat_static" {
#  name      = "nat-static"
#  mode      = "nat"
#  addresses = ["192.168.110.0/24"]
#  bridge    = "virbr11"
#  dhcp {enabled = false}
#  autostart = true
#}

##############################################
# Red aislada con DHCP
##############################################


#resource "libvirt_network" "aislada-dhcp" {
#  name      = "aislada-dhcp"
#  mode = "none"
#  bridge    = "virbr12"
#  addresses = ["192.168.120.0/24"]
#  dhcp {enabled = true}
#  dns {enabled = true}
#  autostart = true



##############################################
# Red aislada sin DHCP
##############################################

#resource "libvirt_network" "aislada-static" {
#  name      = "aislada-static"
#  autostart = true
#  mode = "none"
#  bridge    = "virbr13"
#  addresses = ["192.168.130.0/24"]
#  dhcp {enabled = false}
#}


##############################################
# Red muy aislada
##############################################
resource "libvirt_network" "muy-aislada" {
  name      = "muy-aislada"
  mode      = "none" # sin conectividad
  bridge    = "virbr14"
  autostart = true
}

##############################################
# Red puenteada (bridge) con interfaz física br0
##############################################
#resource "libvirt_network" "bridge-br0" {
#  name   = "bridge-br0"
#  mode   = "bridge"
#  bridge = "br0"
#  autostart = true
#}
