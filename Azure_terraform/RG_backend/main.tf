resource "azurerm_resource_group" "rga" {
  name     = var.name
  location = var.location
}
resource "azurerm_storage_account" "rgstorage" {
  depends_on               = [azurerm_resource_group.rga]
  name                     = "terraazurestorageacc1"
  resource_group_name      = azurerm_resource_group.name
  location                 = azurerm_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}