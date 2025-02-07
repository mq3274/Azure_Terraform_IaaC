# resource "azurerm_subnet" "subnetblock" {
#   for_each             = var.sub-map
#   name                 = each.value.name
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
#   address_prefixes     = each.value.address_prefixes

# }
resource "azurerm_resource_group" "example" {
  name     = "rg2"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

}