resource "azurerm_resource_group" "z-rg" {
  for_each = var.rg-name
  name     = each.key
  location = each.value
}

