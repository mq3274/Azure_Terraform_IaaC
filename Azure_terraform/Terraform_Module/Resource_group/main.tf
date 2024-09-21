resource "azurerm_resource_group" "rg_block" {
  for_each = var.rg_map
  name     = each.key
  location = each.value

}