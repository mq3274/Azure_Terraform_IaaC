terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
}

provider "azurerm" {
 features {
   
 }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-1"
  location = "EastUS"
}
resource "azurerm_resource_group" "rg1" {
  name     = "rg-2"
  location = "EastUS"
}

resource "azurerm_storage_account" "rg-storage" {
  depends_on = [ azurerm_resource_group.rg ]
  name                     = "terrargstorageacc"
  resource_group_name      = "rg-1"
  location                 = "EastUS"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}