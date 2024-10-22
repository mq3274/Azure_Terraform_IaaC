
resource "azurerm_network_security_group" "nsg-block" {
    for_each = var.nsg
  name                = "nsg-vm"
  location            = each.value
  resource_group_name = each.key

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}