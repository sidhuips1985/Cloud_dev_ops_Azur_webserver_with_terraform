provider "azurerm" {
  features {}
}

# Create resource group 
resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"

  tags = {
    environment = "Production_res_group"
  }
}

# Create resource virtual network 
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location           = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    environment = "Production_VNET"
  }
}


# Create resource subnet
resource "azurerm_subnet" "main" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]

  
 
}
# adding security_group to subnet
resource "azurerm_subnet_network_security_group_association" "main"{
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}


#adding publick ip 

resource "azurerm_public_ip" "publickip" {
   name = "LBpublickip"
   resource_group_name = "${azurerm_resource_group.main.name}"
   
   location = "${azurerm_resource_group.main.location}"
   allocation_method = "Static"

   tags = {
    environment = "Production_ip"
  }
}


# code to create LB
resource "azurerm_lb" "main" {

  name="vmblb"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  frontend_ip_configuration {
    name="lbfrontend"
    public_ip_address_id = "${azurerm_public_ip.publickip.id}"
  }

   tags = {
    environment = "Production_LB"
  }

}

# backend pool 
resource "azurerm_lb_backend_address_pool" "main"{
  name                = "BackEndAddressPool"
  
  resource_group_name = azurerm_resource_group.main.name
  loadbalancer_id = "${azurerm_lb.main.id}"

   

}

resource "azurerm_lb_probe" "main" {

  name = "lbprobe"
  resource_group_name = azurerm_resource_group.main.name
  loadbalancer_id     = azurerm_lb.main.id
  protocol = "tcp"
  port = 80
}


resource "azurerm_lb_rule" "lb_rule" {
    resource_group_name = azurerm_resource_group.main.name
    loadbalancer_id = azurerm_lb.main.id
    name = "LBRule"
    protocol = "tcp"
    frontend_port = "80"
    backend_port  = "80"
    frontend_ip_configuration_name = "lbfrontend"  
    enable_floating_ip = false
    backend_address_pool_id = "${azurerm_lb_backend_address_pool.main.id}"  
    idle_timeout_in_minutes = 5 
    probe_id = "${azurerm_lb_probe.main.id}" 
    
}
 
