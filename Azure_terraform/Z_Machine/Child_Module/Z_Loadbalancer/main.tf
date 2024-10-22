
resource "azurerm_resource_group" "rg-block" {
  name     = "LoadBalancerRG"
  location = "Central US"
}

resource "azurerm_public_ip" "pubip-lb" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb-block" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  #frontend ip configration
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pubip-lb.id
  }
}

#backend pool
resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.lb-block.id
  name            = "BackEndAddressPool"
}

#load balancing rule
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.lb-block.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}
#health probe
resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.lb-block.id
  name            = "ssh-running-probe"
  port            = 22
}