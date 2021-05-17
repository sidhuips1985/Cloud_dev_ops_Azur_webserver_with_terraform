resource "azurerm_availability_set" "main" {
 name                         = "avset"
 location                     = azurerm_resource_group.main.location
 resource_group_name          = azurerm_resource_group.main.name
 platform_fault_domain_count  = 2
 platform_update_domain_count = 2
 managed                      = true
 tags = {
    environment = "Production_set"
  }

}

resource "azurerm_network_interface" "main" {
  count               = var.vmcount
  name                = "nic--${count.index+1}"
  location                     = azurerm_resource_group.main.location
  resource_group_name          = azurerm_resource_group.main.name
  

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.main.id}"
    private_ip_address_allocation = "Dynamic"
   
    
    
  }
  tags = {
    environment = "staging"
  }

}  

# buinding interface with LB backend pool 

resource "azurerm_network_interface_backend_address_pool_association" "main" {
  count = var.vmcount
  network_interface_id    = azurerm_network_interface.main[count.index].id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id 

} 


resource "azurerm_linux_virtual_machine" "main" {
 

  count                           = var.vmcount
  name                            = "${var.prefix}-vm-${count.index}"
  resource_group_name             = azurerm_resource_group.main.name
  source_image_id                 = var.image_id
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_A1_v2"
  admin_username                  = var.username
  admin_password                  = var.password
  availability_set_id             = azurerm_availability_set.main.id
  disable_password_authentication = false
  network_interface_ids = ["${element(azurerm_network_interface.main.*.id,count.index)}"]
  tags = {
    environment = "staging"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

 
}



