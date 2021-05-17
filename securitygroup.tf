#security group this will create default access which dose not allow access from internet but allow access with in subnet 
resource "azurerm_network_security_group" "main" {
   name = "lb_vm_securitygroup"
   location            = "${azurerm_resource_group.main.location}"
   resource_group_name = "${azurerm_resource_group.main.name}"

 
   tags = {
    environment = "Production_sec_group"
  }

}