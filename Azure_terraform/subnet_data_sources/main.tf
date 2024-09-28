
resource "azurerm_resource_group" "example" {
  name     = "rg-vm"
  location = "Central US"
}

resource "azurerm_virtual_network" "example" {
  name                = "subnet-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  for_each = var.subs
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = each.value.address_prefixes
}
