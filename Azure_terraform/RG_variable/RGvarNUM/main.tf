
variable "rg-name" {
  default = "Bandu"
  type    = string
}
variable "rg-age" {
  default = 25
  type    = number
}


resource "azurerm_resource_group" "rgblock" {
  name   = var.rg-name
  location = "eastUS"

  tags={
    age=var.rg-age

  }

}
