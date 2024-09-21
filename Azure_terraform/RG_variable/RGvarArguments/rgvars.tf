variable "rg-name" { #Declare variable
  default = "rg-1"   #assign variable
  description = "rg ka naam likha hai"
  type = string
}
variable "location" { #Declare variable
  default = "EastUS"   #Declare variable
  description = "location ki jagah east us hai"
  type = string
}
resource "azurerm_resource_group" "rg1" {
  name     = var.rg-name # using variable
  location = var.location # using variable
}