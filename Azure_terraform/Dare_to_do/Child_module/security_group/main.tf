# resource "azurerm_resource_group" "rg-block" {
#   name     = "rg1"
#   location = "eastUS"
# }
resource "azurerm_network_security_group" "secgrp-block" {
  for_each            = var.secgrp
  name                = "SecurityGroup1"
  location            = var.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }
}