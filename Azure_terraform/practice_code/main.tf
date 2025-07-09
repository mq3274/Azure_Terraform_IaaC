resource "azurerm_resource_group" "rg-block" {

  for_each = var.rg-map
  name     = each.key
  location = each.value

}

resource "azurerm_storage_account" "stg-block" {
  for_each = var.stg-map

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}