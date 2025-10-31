##############################################
# escenario.tf — Escenario proxy + backend
##############################################

locals {

  ##############################################
  # Redes a crear
  ##############################################

  networks = {
    nat-dhcp = {
      name      = "nat-dhcp2"
      mode      = "nat"
      domain    = "example.com"
      addresses = ["192.168.101.0/24"]
      bridge    = "virbr11"
      dhcp      = true
      dns       = true
      autostart = true
    }

    
    muy-aislada = {
      name      = "muy-aislada2"
      mode      = "none" # sin conectividad
      bridge    = "virbr12"
      autostart = true
    }
  }

  ##############################################
  # Máquinas virtuales a crear
  ##############################################

  servers = {
    proxy = {
      name       = "proxy"
      memory     = 1024
      vcpu       = 1
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "nat-dhcp", wait_for_lease = true },
        { network_name = "muy-aislada" }
      ]

      user_data      = "${path.module}/cloud-init/server1/user-data.yaml"
      network_config = "${path.module}/cloud-init/server1/network-config.yaml"
    }

    backend = {
      name       = "backend"
      memory     = 1024
      vcpu       = 1
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "nat-dhcp", wait_for_lease = true },
        { network_name = "muy-aislada"}
      ]

      user_data      = "${path.module}/cloud-init/server2/user-data.yaml"
      network_config = "${path.module}/cloud-init/server2/network-config.yaml"
    }
  }
}
