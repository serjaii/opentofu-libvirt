# opentofu-libvirt

**OpenTofu** es un *fork* de **Terraform 1.5.x**, creado por la comunidad (liderado por la *Linux Foundation*) después de que HashiCorp cambiara la licencia de Terraform a **BUSL 1.1** en 2023.

OpenTofu conserva el **modelo declarativo de infraestructura como código (IaC)**, totalmente compatible con los ficheros `.tf` y los *providers* existentes de Terraform.

Su objetivo es mantener una herramienta **100 % libre y abierta**, compatible con el ecosistema de Terraform, pero sin restricciones de uso.


## Ejemplos

* Ejemplo 1: Máquina virtual conectada a la red "default"
* Ejemplo 2: Máquina virtual con disco adicional
* Ejemplo 3: Máquina virtual conectada a dos redes con DHCP
* Ejemplo 4: Máquina virtual conectada a dos redes: una con DHCP y otra con direccionamiento estático
* Ejemplo 5: Dos máquinas virtuales conectadas entre sí
* Ejemplo 6: Generados de escenarios con módulos

## Escenarios

* Escenario 1: Servidor web y cliente para prácticas de servidores web.
* Escenario 2: proxy y backend para prácticas de proxy inverso
* Escenario 3: Servidor web con php y mariadb. Proyecto base para el proyecto 1 de PI.