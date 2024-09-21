
variable "rg-name" {
  default = "Bandu"
  type    = string
}
variable "hav-u-drink" {
  default = false
  type    = bool

}

resource "azurerm_resource_group" "rgblock" {
  name     = var.rg-name
  location = "eastUS"

  tags = {
    drink = var.hav-u-drink
  }
}
