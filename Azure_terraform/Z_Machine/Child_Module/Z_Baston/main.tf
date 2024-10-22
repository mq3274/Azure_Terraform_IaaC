data "azurerm_subnet" "bastion-subnet" {
  for_each = var.bastions
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_public_ip" "pubip" {
  for_each            = var.bastions
  name                = each.value.pubip
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_bastion_host" "bastion-block" {
  for_each            = var.bastions
  name                = each.value.baston_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "bastionHostIpConfig"
    subnet_id            = data.azurerm_subnet.bastion-subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pubip[each.key].id
  }
}




