resource "azurerm_resource_group" "rg-block" {
  for_each = var.rg_list
  name     = each.key
  location = each.value
}
resource "azurerm_storage_account" "rg-storage-block" {
  depends_on               = [azurerm_resource_group.rg-block]
  for_each                 = var.stg_list
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "my-container" {
  depends_on            = [azurerm_storage_account.rg-storage-block]
  for_each              = var.stg_cont
  name                  = each.value.name
  storage_account_id    = azurerm_storage_account.rg-storage-block.id
  container_access_type = "private"

}