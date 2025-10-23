##############################################
# escenario.tf — Definición del escenario
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
      addresses = ["192.168.160.0/24"]
      bridge    = "virbr20"
      dhcp      = true
      dns       = true
      autostart = true
    }

    nat2 = {
      name      = "nat2"
      mode      = "nat"
      domain    = "example2.com"
      addresses = ["192.168.170.0/24"]
      bridge    = "virbr21"
      dhcp      = true
      dns       = true
      autostart = true
    }

    muy-aislada = {
      name      = "muy-aislada"
      mode      = "none" # sin conectividad
      bridge    = "virbr14"
      autostart = true
    }
  }

  ##############################################
  # Máquinas virtuales a crear
  ##############################################

  servers = {
    server1 = {
      name       = "server1"
      memory     = 1024
      vcpu       = 2
      base_image = "debian13-base.qcow2"

      networks = [
        { network_name = "nat-dhcp", wait_for_lease = true },
        { network_name = "muy-aislada" }
      ]

      disks = [
        { name = "data", size = 5 * 1024 * 1024 * 1024 }
      ]

      user_data      = "${path.module}/cloud-init/server1/user-data.yaml"
      network_config = "${path.module}/cloud-init/server1/network-config.yaml"
    }

    server2 = {
      name       = "server2"
      memory     = 1024
      vcpu       = 2
      base_image = "ubuntu2404-base.qcow2"

      networks = [
        { network_name = "muy-aislada" }
      ]

      user_data      = "${path.module}/cloud-init/server2/user-data.yaml"
      network_config = "${path.module}/cloud-init/server2/network-config.yaml"
    }

    server3 = {
      name       = "server3"
      memory     = 1024
      vcpu       = 2
      base_image = "ubuntu2404-base.qcow2"

      networks = [
        { network_name = "nat2", wait_for_lease = true },
        { network_name = "muy-aislada" }
      ]

      user_data      = "${path.module}/cloud-init/server3/user-data.yaml"
      network_config = "${path.module}/cloud-init/server3/network-config.yaml"
    }
  }
}

