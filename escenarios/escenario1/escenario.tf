##############################################
# escenario.tf — Escenario servidorweb + cliente
##############################################

locals {

  ##############################################
  # Redes a crear
  ##############################################

  networks = {
    nat-dhcp = {
      name      = "nat-dhcp"
      mode      = "nat"
      domain    = "example.com"
      addresses = ["192.168.100.0/24"]
      bridge    = "virbr10"
      dhcp      = true
      dns       = true
      autostart = true
    }

    muy-aislada2 = {
      name      = "muy-aislada2"
      mode      = "none" # sin conectividad
      bridge    = "virbr14"
      autostart = true
    }
  }

  ##############################################
  # Máquinas virtuales a crear
  ##############################################

  servers = {
    servidorweb = {
      name       = "servidorweb"
      memory     = 1024
      vcpu       = 1
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "nat-dhcp", wait_for_lease = true },
        { network_name = "muy-aislada2" }
      ]

      user_data      = "${path.module}/cloud-init/server1/user-data.yaml"
      network_config = "${path.module}/cloud-init/server1/network-config.yaml"
    }

    cliente = {
      name       = "cliente"
      memory     = 1024
      vcpu       = 1
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "nat-dhcp", wait_for_lease = true },
        { network_name = "muy-aislada2" }
      ]

      user_data      = "${path.module}/cloud-init/server2/user-data.yaml"
      network_config = "${path.module}/cloud-init/server2/network-config.yaml"
    }
  }
}
