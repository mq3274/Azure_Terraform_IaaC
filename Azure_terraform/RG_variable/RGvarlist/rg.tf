variable "rg-names" {
  default = ["rg11","rg12"]
  description = "rg k naam dedo"
  type = string
}
variable "location" {
  default = "EastUS"
  description = "location ki jagah east us hai"
  type = string
}
resource "azurerm_resource_group" "rg1" {
  for_each = toset(var.rg-names)
  name      = each.value
  location = var.location
}