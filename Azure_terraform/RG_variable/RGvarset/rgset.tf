variable "rg-names" {
  type = set(string)
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg-names
  name     = each.key
  location = "EastUS"
}