resource "azurerm_resource_group" "rg-block" {

  for_each = var.rg-map
  name     = each.key
  location = each.value

}

# resource "azurerm_storage_account" "stg-block" {

#   name                     = "stgmacbook"
#   resource_group_name      = azurerm_resource_group.rg-block.name
#   location                 = azurerm_resource_group.rg-block.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }