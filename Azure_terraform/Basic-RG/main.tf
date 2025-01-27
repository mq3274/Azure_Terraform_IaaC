
variable "rg-name" {
  default = "Bandu"
  type    = string
}

variable "rg-location" {
  type    = string
  default = "eastUS"
}

resource "azurerm_resource_group" "rgblock" {
  name     = var.rg-name
  location = var.rg-location

}
