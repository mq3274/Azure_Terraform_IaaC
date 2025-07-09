resource "azurerm_resource_group" "rg-block" {
  name     = "rg-macbook"
  location = "eastus"

}

resource "azurerm_storage_account" "stg-block" {

  name                     = "stgmacbook"
  resource_group_name      = azurerm_resource_group.rg-block.name
  location                 = azurerm_resource_group.rg-block.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}